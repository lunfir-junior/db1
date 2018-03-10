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

    QStringList parse(QString file);

};

#endif // GENERATOR_H
