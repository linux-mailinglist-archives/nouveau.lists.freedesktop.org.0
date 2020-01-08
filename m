Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C8B138309
	for <lists+nouveau@lfdr.de>; Sat, 11 Jan 2020 20:32:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC7A6E24D;
	Sat, 11 Jan 2020 19:32:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Wed, 08 Jan 2020 20:59:19 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4CF6E33A
 for <nouveau@lists.freedesktop.org>; Wed,  8 Jan 2020 20:59:19 +0000 (UTC)
Received: from mail-pl1-f180.google.com ([209.85.214.180]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MOzGc-1j3YT40rQy-00PNKf; Wed, 08 Jan 2020 21:54:14 +0100
Received: by mail-pl1-f180.google.com with SMTP id ay11so1582367plb.0;
 Wed, 08 Jan 2020 12:54:13 -0800 (PST)
X-Gm-Message-State: APjAAAW55FakGbrpalHABAQiRPjpJ9RqiyYJY4wTsjvk/r8OK4X+TT+O
 uaULWYRlFfIKhnXEwrHeVRoNwT5r3ylhUVaPwvg=
X-Google-Smtp-Source: APXvYqyt7qWPMbb6m9h/4PQhRs0y159Kx6Uivm6Z+B5Q5nxhhZUKK+jBierZEh41gZgxiLkvgkWmKuzOcUQAJHTJ9Lg=
X-Received: by 2002:a0c:bd20:: with SMTP id m32mr5946876qvg.197.1578516850954; 
 Wed, 08 Jan 2020 12:54:10 -0800 (PST)
MIME-Version: 1.0
References: <20200108200528.4614-1-krzk@kernel.org>
 <20200108200528.4614-2-krzk@kernel.org>
In-Reply-To: <20200108200528.4614-2-krzk@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 8 Jan 2020 21:53:54 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2ieH2G5GJvWMev39QkmSFvWSb0sYZ_0L5McR6AZFiayA@mail.gmail.com>
Message-ID: <CAK8P3a2ieH2G5GJvWMev39QkmSFvWSb0sYZ_0L5McR6AZFiayA@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:g9E/DHYDerAF765D9ZGSli8tbMiChFQuFhlsvtTeCrPpgvB+6fL
 qedf72XEgWTu9gdhgUl/LpAdjTZi065iUEFnyjGMjoUB4EXuS1R1FbkO/AedQ4b0BbktzOc
 bo/A5UqQEtN8C+O8YhB5npqaTICaPCae88zOplIiph5QyZmxKH+V5iWYZNTvtF80xvzZp0+
 aOeKLRjMYO5vLPjAKT5EQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:m2hLR2rBJ8k=:3wh2C1VgMWyZ4EKvrHI5FW
 0UQxq3mWLFQydU3CkieWzOFVXsIcAbs6g4pzA+FNjy5x8HrMzW7ax5Ex67jayAGyAM1VKgX04
 hUJrtWozarcdS4cT91E1FGEV37jin1ND5SsYYa+7TsaeBL5U3Evm2+dNWTqbbJK5teDvIcfE8
 5wXspv+BOTqkHSNu9jVCPu4mYYIObrhcMGUbjuOgKEvosGDF75b43vz+vIXdZ4cCPIuVz8p21
 FSIzLh8z3b20SiGJ/SwRL8Z30xFlomb1AIVbCCXFyDlTqzAgLFA8u0oujqkvt0ikRCwDnB/iL
 qUXkJfZUryfk5gP3NMo3fR3ViDe2f0I69OtATQALEmJE1+Tn2jVWonQtOey/YCzUzBekV5Rrh
 KI63UIVeIX5KRPL+ZQ6cHb3+hnVs7hUzD1i4KvqDQ4YTJVDZUrzK3DxGrQEdTLvbNRCWw+VKy
 GSVCRfhjakRy9yTWnhy2ptkm2URVJ3cAK7oKIv+m+9YJLslMkAV9nUMEviLeSoLVmYUOo3Ifr
 eKZQiO+NfkzEaJaO1xoqPu5lJXy2jYj6rQzy2f8rKCjSw47BQ41X2pZSP10DY/QmZf8JoETaQ
 eLsoVKppIV8fLEtFzLM9+oYPf2FCsyO5BGZGw1yLOtAhOXFLTowK1D1UStk8q5JsxmGoyzccW
 fw6DHdeTr2Mz9QBIUKhIfUrYKmfdm11bs/A6jTQJ/ywcD7svvOSYECWGx4ZIETeEwdcRKlLjM
 0CS3biHO77tLCKtjL5gyZZhJBnmDlHVRCkuG2esXFwA5UfjBDbK9Fk8VetH+nDCdX/rB4E5EQ
 O/qkgUpewqQrn9yW3RYaFS1M6ZYwc36rhOIMYgGsPru2bgyE+GAqjhYI7a5EDmx5kCp1vbjXv
 GSQv3IWTUZhHdAbwW56g==
X-Mailman-Approved-At: Sat, 11 Jan 2020 19:32:29 +0000
Subject: Re: [Nouveau] [PATCH v2 1/9] iomap: Constify ioreadX() iomem
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
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Jason Wang <jasowang@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Networking <netdev@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-arch <linux-arch@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Ben Skeggs <bskeggs@redhat.com>,
 ML nouveau <nouveau@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 alpha <linux-alpha@vger.kernel.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Parisc List <linux-parisc@vger.kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Jan 8, 2020 at 9:05 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> The ioreadX() and ioreadX_rep() helpers have inconsistent interface.  On
> some architectures void *__iomem address argument is a pointer to const,
> on some not.
>
> Implementations of ioreadX() do not modify the memory under the address
> so they can be converted to a "const" version for const-safety and
> consistency among architectures.
>
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for getting this done!

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

> Changes since v1:
> 1. Constify also ioreadX_rep() and mmio_insX(),
> 2. Squash lib+alpha+powerpc+parisc+sh into one patch for bisectability,

The alpha and parisc versions should be independent, I was thinking
you leave them as separate patches, but this work for me too.

I have no real opinion on the other 8 patches, I would have left
them out completely, but they don't hurt either.

         Arnd
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
