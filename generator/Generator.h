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
    static QString timestamp;
    static QString procedure;
    static QString trigger;

  private:
    QStringList read(QString file);
    QStringList parse(QStringList schema);
    QString addTimestamp(QString table, QString column);
    QString addFunction(QString table);
    QString addTrigger(QString table);
};

#endif // GENERATOR_H
