#ifndef GENERATOR_H
#define GENERATOR_H

#include <QString>
#include <QFile>
#include <QTextStream>
#include <QDebug>

class Generator
{
  public:
    explicit Generator();
    virtual ~Generator();

    void generate(QString file);

    static QString table;
  private:
    void parse(QString file);

};

#endif // GENERATOR_H
