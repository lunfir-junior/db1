#include <QCoreApplication>
#include "Generator.h"

int main(int argc, char *argv[])
{
  QCoreApplication a(argc, argv);
  Generator generator;
  QString file = QCoreApplication::applicationDirPath().append("/schema.yaml");
  QStringList statements = generator.generate(file);

  foreach( auto i, statements )
    qDebug().noquote() << i;

  a.quit();
  return 0;
}
