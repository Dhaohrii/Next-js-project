import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";
import Navbar from "../component/navbar";
import Footer from "../component/footer";
import { ShopsProvider } from "@/contexts/shopsContext";
const inter = Inter({ subsets: ["latin"] });

export const metadata: Metadata = {
  title: "Create Next App",
  description: "Generated by create next app",
};



export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <ShopsProvider>
      <html lang="en">
        <body className={inter.className}>
          <header>
            {/* Pass isLoggedIn prop to Navbar */}
            <Navbar  />
          </header>
          <main>
            {children}
          </main>
          <footer>
            <Footer />
          </footer>
        </body>
      </html>
    </ShopsProvider>
  );
}
