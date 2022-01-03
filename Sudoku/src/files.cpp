#include "files.h"

Files::Files() {};

//void Files::setCurrentPage(int _page) {
//    QFile file("currentPage.txt");
//    file.open(stderr, QIODevice::WriteOnly);
//    if (!file.open(QIODevice::WriteOnly | QIODevice::Text))
//            return;
//    QTextStream out(&file);
//    out << _page;
//    file.close();
//}

//QString Files::getCurrentPage() {
//    QFile file("cirrentPage.txt");
//    file.open(stderr, QIODevice::ReadOnly);
//    if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
//            return "-1";
//    QTextStream in(&file);
//    QString line = in.readLine();
//    file.close();
//    return line;
//}
