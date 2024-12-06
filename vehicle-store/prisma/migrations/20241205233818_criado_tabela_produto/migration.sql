-- CreateTable
CREATE TABLE "produto" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "categoria" TEXT NOT NULL,
    "fabricante" TEXT NOT NULL,
    "quantidade" INTEGER NOT NULL,
    "dataATT" TIMESTAMP(3) NOT NULL,
    "dataCreate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "produto_pkey" PRIMARY KEY ("id")
);
