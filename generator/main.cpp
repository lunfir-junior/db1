#include <QCoreApplication>
#include "Generator.h"

int main(int argc, char *argv[])
{
  QCoreApplication a(argc, argv);
  Generator generator;
  QString file = QCoreApplication::applicationDirPath().append("/schema.yaml");

  generator.generate(file);

  a.quit();
  return 0;
}
