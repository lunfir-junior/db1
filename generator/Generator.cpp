#include "Generator.h"

QString Generator::table = QString("CREATE TABLE %1 ( %2 );");

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
    out.append(table.arg(schema.at(i-1), schema.at(i)));
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
