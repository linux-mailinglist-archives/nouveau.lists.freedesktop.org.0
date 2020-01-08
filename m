Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AE3138339
	for <lists+nouveau@lfdr.de>; Sat, 11 Jan 2020 20:33:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19F56E2B0;
	Sat, 11 Jan 2020 19:32:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227A889C9A;
 Wed,  8 Jan 2020 08:10:18 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id 13so12429oij.13;
 Wed, 08 Jan 2020 00:10:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zSvatSaXmaDcygklTO+AiD7URC1DncR275ZO9qcviaY=;
 b=St5G9WzL/qGPbV3AzUO1EfVdzOCNcFV2qJmyMZbDXjcPJUnAIGaS0AFR+hXHsVuBvn
 sR830JChBzR02nWQ+EOLq9xgQYTsCqAlGuSfSwKIm2C8QSBLtTZcBa8soyrAd8ZHcbUy
 xM6AqTi20Oue2OTEYwXu8an+nCBAkKkihBAbIUJiOkLhudU6/7iy0jcLqRuLGaNh5ztu
 28XmJfYTdU7rRMjBIlsEbo4upuN3mFOOqrOqPfjoxJ/MyRyIM2CxBkeMeO2Ew/Cbs/TI
 cd4jbvqyNaabTC/+1e78sxUD74Q5WRq9BAWM8EpKcgNxQ+t/iyZxBL/HBGM1uIV5kPVN
 lZdQ==
X-Gm-Message-State: APjAAAVSDgqWDH0v04opDi6MdRmVVvdJtQ02OkeLggE3AtwDEiE8bCoq
 LjFKIi4Yn18TDrg7IdSjeWigFPoW8BbiGUnbFk0=
X-Google-Smtp-Source: APXvYqx7mMV6iu/aCjHaPWwxCajM/7EbWdhdn3wdjlil8XEXHsid4BFGqUofVL4JHvNq7QwetgrnnLwPgZu0svS796A=
X-Received: by 2002:a05:6808:292:: with SMTP id
 z18mr2042282oic.131.1578471017446; 
 Wed, 08 Jan 2020 00:10:17 -0800 (PST)
MIME-Version: 1.0
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <1578415992-24054-3-git-send-email-krzk@kernel.org>
In-Reply-To: <1578415992-24054-3-git-send-email-krzk@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jan 2020 09:10:06 +0100
Message-ID: <CAMuHMdXHhF6GhS1W8qS4j7Jv5YnxXjcRopT5QSA=+trc8qwFng@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailman-Approved-At: Sat, 11 Jan 2020 19:32:29 +0000
Subject: Re: [Nouveau] [RFT 02/13] alpha: Constify ioreadX() iomem argument
 (as in generic implementation)
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
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>,
 David Airlie <airlied@linux.ie>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Jason Wang <jasowang@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 netdev <netdev@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, alpha <linux-alpha@vger.kernel.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Parisc List <linux-parisc@vger.kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Krzysztof,

On Tue, Jan 7, 2020 at 5:53 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> The ioreadX() helpers have inconsistent interface.  On some architectures
> void *__iomem address argument is a pointer to const, on some not.
>
> Implementations of ioreadX() do not modify the memory under the address
> so they can be converted to a "const" version for const-safety and
> consistency among architectures.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

> --- a/arch/alpha/include/asm/io.h
> +++ b/arch/alpha/include/asm/io.h
> @@ -151,9 +151,9 @@ static inline void generic_##NAME(TYPE b, QUAL void __iomem *addr)  \
>         alpha_mv.mv_##NAME(b, addr);                                    \
>  }
>
> -REMAP1(unsigned int, ioread8, /**/)
> -REMAP1(unsigned int, ioread16, /**/)
> -REMAP1(unsigned int, ioread32, /**/)
> +REMAP1(unsigned int, ioread8, const)
> +REMAP1(unsigned int, ioread16, const)
> +REMAP1(unsigned int, ioread32, const)

If these would become "const volatile", there would no longer be a need
for the last parameter of the REMAP1() macro.

>  REMAP1(u8, readb, const volatile)
>  REMAP1(u16, readw, const volatile)
>  REMAP1(u32, readl, const volatile)

Same for REMAP2() macro below, for iowrite*().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
