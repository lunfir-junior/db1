#include "Generator.h"

QString Generator::table = QString("CREATE TABLE %1 ( id serial primary key, %2);");

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

  schema = parse(file);
  len = schema.length();

  for ( int i = 1; i < len; i += 2 ) {
    out.append(table.arg(schema.at(i-1), schema.at(i)));
  }

  return out;
}

QStringList Generator::parse(QString file)
{
  QFile schema(file);
  QStringList out;
  QString buf;

  if ( !schema.open(QIODevice::ReadOnly) )
    qWarning() << "file error: " << schema.errorString();

  QTextStream in(&schema);
  while( !in.atEnd() ) {
    QString line = in.readLine().trimmed();

    if ( line.contains(QRegularExpression("([A-Z])\\w+:"))) {
      if ( !buf.isEmpty() ) {
        out.append(buf.remove(buf.length() - 2, 2));
        buf.clear();
      }
      out.append(line.remove(":"));
    }

    if ( line.contains(QRegularExpression("([a-z]\\w+: \\w+)")))
      buf.append(line.remove(":").append(", "));
  }

  buf.remove(buf.length() - 2, 2);
  out.append(buf);

  return out;
}
