import express, { Request, Response } from "express";

const app = express();
const port = process.env.BACKEND_PORT ?? 3000;

app.get("/ping", (_req: Request, res: Response) => {
  res.send("pong");
});

app.listen(port, () => {
  console.log(`Backend listening on port ${port}`);
});
