#include "Generator.h"

QString Generator::table = QString("CREATE TABLE goods ( id serial primary key, name varchar(15) NOT NULL, category varchar(20) NOT NULL, price numeric(10, 2) NOT NULL, UNIQUE(name));");

Generator::Generator()
{
  qDebug() << table;
}

Generator::~Generator()
{

}

void Generator::generate(QString file)
{
  printf("%s\n", file.toLatin1().data());
  parse(file);

}

void Generator::parse(QString file)
{
  QFile schema(file);
//  QMap<QString, QString> out;
  QStringList out;

  if ( !schema.open(QIODevice::ReadOnly) )
    qWarning() << "file error: " << schema.errorString();

  QTextStream in(&schema);
  while( !in.atEnd() ) {
//    QString out = in.readLine()/*.trimmed()*/;
//    out.append(in.readLine().trimmed());
//    QStringList list = out.split()
    QString line = in.readLine().trimmed();
    if ( !line.isEmpty() )
      out.append(line);
  }
  qDebug() << out;

//  printf("%s\n", out.toLatin1().data());
}
