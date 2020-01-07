Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C717F13833A
	for <lists+nouveau@lfdr.de>; Sat, 11 Jan 2020 20:33:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9FB6E456;
	Sat, 11 Jan 2020 19:32:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Tue, 07 Jan 2020 17:13:42 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 979DB6E830
 for <nouveau@lists.freedesktop.org>; Tue,  7 Jan 2020 17:13:42 +0000 (UTC)
Received: from mail-qt1-f176.google.com ([209.85.160.176]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N4eOd-1jo5yt39WR-011iUd; Tue, 07 Jan 2020 18:08:36 +0100
Received: by mail-qt1-f176.google.com with SMTP id e12so383065qto.2;
 Tue, 07 Jan 2020 09:08:36 -0800 (PST)
X-Gm-Message-State: APjAAAXqTVI9wmEOoULoNlRQy3R9GNmCICUVYlUn8yBG7qDMh+EO8x9j
 mcjhreC9V3O3I+qznkNXp9QBMZed/SfwiFv6ZzI=
X-Google-Smtp-Source: APXvYqzRk52Ew2lmsQMfvghk3ylFHcEIR88yL70qbdC0HVK9etbYRWgu7fgyXH4+189J3IyWZY+dkJGnvq1XjVlLM+A=
X-Received: by 2002:a05:620a:a5b:: with SMTP id
 j27mr335658qka.286.1578416914895; 
 Tue, 07 Jan 2020 09:08:34 -0800 (PST)
MIME-Version: 1.0
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <1578415992-24054-6-git-send-email-krzk@kernel.org>
In-Reply-To: <1578415992-24054-6-git-send-email-krzk@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 7 Jan 2020 18:08:18 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2eMB34Qd=U_9vGBCN3m5Zh4qDhyEpGH6M=M4e22aPQLQ@mail.gmail.com>
Message-ID: <CAK8P3a2eMB34Qd=U_9vGBCN3m5Zh4qDhyEpGH6M=M4e22aPQLQ@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:IDMrLgC3H0ekmK6SwU9PMUPDAlZ6fljKTY5XMWA8Myz/jUHSKWE
 pXwUQZK18iHBuQPyaE7xSxkyKwdHREvojqcA9MEODrB/MbXHbg85sr+aRj/zFD4vz53ck5J
 FWTz9ZovYLhMwd21BkrUqaYI4DcqD19BcLadoJ45YmK9GH0tK/vVTscAqoPrzAkd9yBShIg
 t6XFKKvd4xI7+zETbAxkg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wZXur4KIFVw=:JUXFSFAUgL8flXyRruMPHu
 soXYhx++jhRQV+S2KE0csUpd+dcBla53JMFcWfJ+f2A7u8FOD+m6u+i6yaojvk8TkW4qGIGWK
 xxUnVk1ouffCEc4nGFNlaoglYg3HAg9uvAjCMzpkPlQgb8cYs5Kxlj2A4mjDQZvVletzpuzqx
 ZCWc3ihZEHwh5421Vlnm1dLApvkZ9Ef5AjkaDvd8iGnXGP1Onz3Fsn0qdfNlRsJixbNfOoIjI
 AmEWDHmsHor3lY/MqKJHfAOj/L1KnLXeZhZVJBE+KLhtMrlA9ppn76s8xNJFZ7EoK7t2f+Xo+
 +h9l6lGXegaeYZ42BRmuN+wnCqd/MqDBo7/WQp+iIU4RdLMHDhiEO0j20OknclNesgAaiHHaQ
 2L6mszo/o4GaNiQQ5hIeH0HO5MDJMJvMQePdsD7MD97/QXlPVrJe1ZDle9G3RvHHavG5pvmcb
 zcdOY8Rmi2WRpuR2uwcYVmdpDOD5CtJctSOS87MTsByp9r+N43qnFbnRIRu4Y/1I78Iy/a2U/
 D8yzUte3iyMOKc6jG32FrQvc9F3YSTFMQ/g4JDUgORhdzATHlqJmsdtBa7OMmivBFgOuN5IQq
 Rzto3Tq+69liIJAduJnDG2E8V5rGCklfHaDYLuKgGPjHAvQFJP6cSP1UUe4blJdUewLIHH8zt
 NtgN+sofFFd00A8T67mGqur5y+FTwGLrWjCUGTNAaRzulLzzlfVJqfjueg2Altu654wzkCbfS
 p/r+w5+ywkPqIC595yggj2rkx74PChlodqugpqhdFvs16MKkwOhnbfDZ7wAO49NKbhTP6XN7B
 TvFSbc/tnnv+4eLPbPokpWUgIwwPWM7ucGxLoJNea3f1anumyEzh9YUvzcVk8kAbRbfKkO9TB
 N2ykpOC3zOs+rEd24kaA==
X-Mailman-Approved-At: Sat, 11 Jan 2020 19:32:29 +0000
Subject: Re: [Nouveau] [RFT 03/13] sh: Constify ioreadX() iomem argument (as
 in generic implementation)
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
 Jason Wang <jasowang@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Networking <netdev@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-arch <linux-arch@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
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
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Jan 7, 2020 at 5:54 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> The ioreadX() helpers have inconsistent interface.  On some architectures
> void *__iomem address argument is a pointer to const, on some not.
>
> Implementations of ioreadX() do not modify the memory under the address
> so they can be converted to a "const" version for const-safety and
> consistency among architectures.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

The patch looks good, but I think this has to be done together with the powerpc
version and the header that declares the function, for bisectibility.

       Arnd
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
