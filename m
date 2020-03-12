Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1E5197587
	for <lists+nouveau@lfdr.de>; Mon, 30 Mar 2020 09:22:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A55006E142;
	Mon, 30 Mar 2020 07:22:23 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 394 seconds by postgrey-1.36 at gabe;
 Thu, 12 Mar 2020 11:02:37 UTC
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BFDA6EA73;
 Thu, 12 Mar 2020 11:02:37 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48dQjL3pfwz9sPF;
 Thu, 12 Mar 2020 21:55:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1584010558;
 bh=72/MkVf9VVMOXQXQBCEOJd5iIUWgKkmEQGqh1LToq2c=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=kjtDKke2a24ahWnaI2Uj0G4Fe2Y+Jmmv/GYwuEOLFEW9uRKLJ/Eh8hY/uIvPOkWOq
 hSpbFhZ+nkMkq9HnJFD5n60KJODzNOkbfNQ2xKBvxmtGjcLFu/cP0AF6WyLXOSMULb
 6fFjUvKvb8/nZ+iPRU20W0VkcxW1QK6SeQvdds5ZfmEH3nf/wYggGS/dPu8fp0XU/0
 5piT2dBaqMVbWuvgxSVjBFiUYMtS2zI6exgAeql41Nme4eoBMZr+hItq7bW8gr3rM3
 jCRuhb1gAjdGh5ftRaRGO6Z5fFXzHCOWGuRXdE2RxOkjZdMiy8L8pyOPyQMC+hwaj9
 VAqGftLnfpYYg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Richard Henderson
 <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Alexey Brodkin <abrodkin@synopsys.com>, Vineet Gupta
 <vgupta@synopsys.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich
 Felker <dalias@libc.org>, Dave Airlie <airlied@redhat.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Ben Skeggs
 <bskeggs@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Jiri
 Slaby <jirislaby@gmail.com>, Nick Kossifidis <mickflemm@gmail.com>, Luis
 Chamberlain <mcgrof@kernel.org>, Kalle Valo <kvalo@codeaurora.org>, "David
 S. Miller" <davem@davemloft.net>, Dave Jiang <dave.jiang@intel.com>, Jon
 Mason <jdmason@kudzu.us>, Allen Hubbe <allenbh@gmail.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Arnd Bergmann
 <arnd@arndb.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Andrew
 Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-ntb@googlegroups.com,
 virtualization@lists.linux-foundation.org, linux-arch@vger.kernel.org
In-Reply-To: <20200219175007.13627-2-krzk@kernel.org>
References: <20200219175007.13627-1-krzk@kernel.org>
 <20200219175007.13627-2-krzk@kernel.org>
Date: Thu, 12 Mar 2020 21:55:44 +1100
Message-ID: <87ftedj0zz.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:22:22 +0000
Subject: Re: [Nouveau] [RESEND PATCH v2 1/9] iomap: Constify ioreadX() iomem
 argument (as in generic implementation)
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Krzysztof Kozlowski <krzk@kernel.org> writes:
> diff --git a/arch/powerpc/kernel/iomap.c b/arch/powerpc/kernel/iomap.c
> index 5ac84efc6ede..9fe4fb3b08aa 100644
> --- a/arch/powerpc/kernel/iomap.c
> +++ b/arch/powerpc/kernel/iomap.c
> @@ -15,23 +15,23 @@
>   * Here comes the ppc64 implementation of the IOMAP 
>   * interfaces.
>   */
> -unsigned int ioread8(void __iomem *addr)
> +unsigned int ioread8(const void __iomem *addr)
>  {
>  	return readb(addr);
>  }
> -unsigned int ioread16(void __iomem *addr)
> +unsigned int ioread16(const void __iomem *addr)
>  {
>  	return readw(addr);
>  }
> -unsigned int ioread16be(void __iomem *addr)
> +unsigned int ioread16be(const void __iomem *addr)
>  {
>  	return readw_be(addr);
>  }
> -unsigned int ioread32(void __iomem *addr)
> +unsigned int ioread32(const void __iomem *addr)
>  {
>  	return readl(addr);
>  }
> -unsigned int ioread32be(void __iomem *addr)
> +unsigned int ioread32be(const void __iomem *addr)
>  {
>  	return readl_be(addr);
>  }
> @@ -41,27 +41,27 @@ EXPORT_SYMBOL(ioread16be);
>  EXPORT_SYMBOL(ioread32);
>  EXPORT_SYMBOL(ioread32be);
>  #ifdef __powerpc64__
> -u64 ioread64(void __iomem *addr)
> +u64 ioread64(const void __iomem *addr)
>  {
>  	return readq(addr);
>  }
> -u64 ioread64_lo_hi(void __iomem *addr)
> +u64 ioread64_lo_hi(const void __iomem *addr)
>  {
>  	return readq(addr);
>  }
> -u64 ioread64_hi_lo(void __iomem *addr)
> +u64 ioread64_hi_lo(const void __iomem *addr)
>  {
>  	return readq(addr);
>  }
> -u64 ioread64be(void __iomem *addr)
> +u64 ioread64be(const void __iomem *addr)
>  {
>  	return readq_be(addr);
>  }
> -u64 ioread64be_lo_hi(void __iomem *addr)
> +u64 ioread64be_lo_hi(const void __iomem *addr)
>  {
>  	return readq_be(addr);
>  }
> -u64 ioread64be_hi_lo(void __iomem *addr)
> +u64 ioread64be_hi_lo(const void __iomem *addr)
>  {
>  	return readq_be(addr);
>  }
> @@ -139,15 +139,15 @@ EXPORT_SYMBOL(iowrite64be_hi_lo);
>   * FIXME! We could make these do EEH handling if we really
>   * wanted. Not clear if we do.
>   */
> -void ioread8_rep(void __iomem *addr, void *dst, unsigned long count)
> +void ioread8_rep(const void __iomem *addr, void *dst, unsigned long count)
>  {
>  	readsb(addr, dst, count);
>  }
> -void ioread16_rep(void __iomem *addr, void *dst, unsigned long count)
> +void ioread16_rep(const void __iomem *addr, void *dst, unsigned long count)
>  {
>  	readsw(addr, dst, count);
>  }
> -void ioread32_rep(void __iomem *addr, void *dst, unsigned long count)
> +void ioread32_rep(const void __iomem *addr, void *dst, unsigned long count)
>  {
>  	readsl(addr, dst, count);
>  }

This looks OK to me.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
