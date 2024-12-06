import Product from "../entity/Product";
import prisma from "../prisma";

export default class ProductRepository {
    
    public async save(product: Product) {
        try {
            await prisma.produto.create({
                data: {
                    id: product.getId(),
                    nome: product.getName(),
                    categoria: product.getCategory(),
                    fabricante: product.getManufacturer(),
                    quantidade: Number(product.getAmount()),
                    dataATT: product.getUpdateAt(),
                    dataCreate: product.getCreateAt()
                }
            })
        } catch (err) {
            console.log(err)
        }


        // try {
        //     this.connection.connect();
        //     const sql = "INSERT INTO product (id, name, category, manufacturer, amount, updateAt, createAt) VALUES ($1, $2, $3, $4, $5, $6, $7)";
        //     const values = [
        //         product.getId(),
        //         product.getName(),
        //         product.getCategory(),
        //         product.getManufacturer(),
        //         product.getAmount(),
        //         product.getUpdateAt(),
        //         product.getCreateAt()
        //     ]

        //     await this.connection.query(sql, values)
        // }catch(error: any){
        //     console.log(error)
        // }finally{
        //     this.connection.end()
        // }
    }


    public async findAll() {
        try {
            return await prisma.produto.findMany()
        } catch (error: any) {
            console.log(error)
        }
    }

    public async findAmountByCategory() {
        try {
            return prisma.produto.groupBy({
                by: ['categoria'],
                _sum: {
                    quantidade: true
                },
                orderBy: { _sum: { quantidade: 'asc' } }
            })
        } catch (error: any) {
            console.log(error)
        }
    }

    public async findById(id: string) {
        try {
            return prisma.produto.findUnique({
                where: {
                    id: id
                }
            })

        } catch (error: any) {
            console.log(error)
        }
    }
}