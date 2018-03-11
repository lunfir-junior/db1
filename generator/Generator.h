#ifndef GENERATOR_H
#define GENERATOR_H

#include <QString>
#include <QFile>
#include <QTextStream>
#include <QDebug>

#include <QRegularExpression>

class Generator
{
  public:
    explicit Generator();
    virtual ~Generator();

    QStringList generate(QString file);

    static QString table;
  private:
    QStringList read(QString file);
    QStringList parse(QStringList schema);


};

#endif // GENERATOR_H
