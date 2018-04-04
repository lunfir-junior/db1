#include "Generator.h"

QString Generator::table = QString("CREATE TABLE %1 ( %2 );");
QString Generator::timestamp = QString("ALTER TABLE %1 ADD COLUMN %1_%2 TIMESTAMP DEFAULT NOW();");
QString Generator::procedure = QString("CREATE OR REPLACE FUNCTION update()\nRETURNS TRIGGER AS $$\n BEGIN\n NEW.%1_updated = NOW();\n RETURN NEW;\n END;\n$$ language 'plpgsql';");
QString Generator::trigger = QString("CREATE TRIGGER update_%1_updated BEFORE UPDATE ON %1 FOR EACH ROW EXECUTE PROCEDURE update();\n");

Generator::Generator()
{
  qDebug() << __PRETTY_FUNCTION__;
}

Generator::~Generator()
{
  qDebug() << __PRETTY_FUNCTION__;
}

QStringList Generator::generate(QString file)
{
  QStringList out, schema;
  int len;

  schema = parse(read(file));
  len = schema.length();

  for ( int i = 1; i < len; i += 2 ) {
    QString prefix = schema.at(i-1);

    out.append(table.arg(prefix, schema.at(i)));
    out.append(addTimestamp(prefix, "created"));
    out.append(addTimestamp(prefix, "updated"));
    out.append(addFunction(prefix));
    out.append(addTrigger(prefix));
  }

  return out;
}

QStringList Generator::read(QString file)
{
  QFile schema(file);
  QStringList out;

  if ( !schema.open(QIODevice::ReadOnly) )
    qWarning() << "file error: " << schema.errorString();

  QTextStream in(&schema);
  while( !in.atEnd() )
    out.append(in.readLine().trimmed());

  schema.close();

  return out;
}

QStringList Generator::parse(QStringList schema)
{
  QStringList out;
  QString buf, prefix;
  int len = schema.length();

  for ( int i = 0; i < len; i++ ) {
    QString line = schema.at(i);

    if ( line.contains(QRegularExpression("([A-Z])\\w+:"))) {
      if ( !buf.isEmpty() ) {
        out.append(buf.remove(buf.length() - 2, 2));
        buf.clear();
      }

      prefix = line.remove(":").toLower();
      out.append(prefix);

      prefix.append('_');
      buf.append(prefix + QString("id serial primary key, "));
    }

    if ( line.contains(QRegularExpression("([a-z]\\w+: \\w+)")))
      buf.append(prefix + line.remove(":").append(", "));
  }

    buf.remove(buf.length() - 2, 2);
    out.append(buf);

  return out;
}

QString Generator::addTimestamp(QString table, QString column)
{
  return timestamp.arg(table, column);
}

QString Generator::addFunction(QString table)
{
  return procedure.arg(table);
}

QString Generator::addTrigger(QString table)
{
  return trigger.arg(table);
}
