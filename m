Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9500213832B
	for <lists+nouveau@lfdr.de>; Sat, 11 Jan 2020 20:33:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E901F6E46F;
	Sat, 11 Jan 2020 19:32:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A976389A57
 for <nouveau@lists.freedesktop.org>; Tue,  7 Jan 2020 17:15:31 +0000 (UTC)
Received: from mail-vs1-f42.google.com ([209.85.217.42]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MsqIi-1jhnLO0rvc-00t9uU; Tue, 07 Jan 2020 18:10:26 +0100
Received: by mail-vs1-f42.google.com with SMTP id v12so34354252vsv.5;
 Tue, 07 Jan 2020 09:10:25 -0800 (PST)
X-Gm-Message-State: APjAAAXcFBPJhtnAplKjHRRjLF/K5QxJWJcXvXVymcNej2rvrXx/X0fi
 wVBu6JhvdAX+IlcD7MXeTvFjRIiiBGm7+ru0Wro=
X-Google-Smtp-Source: APXvYqxwO5AyDQus85+IK5BIt7KfSsh7NvpnQb9bzWV5OgyrFYMfLh14xqWUd9CW/X7TSfP34I+W9RVMaa5KUvf/Vb8=
X-Received: by 2002:a0c:bd20:: with SMTP id m32mr365813qvg.197.1578417023930; 
 Tue, 07 Jan 2020 09:10:23 -0800 (PST)
MIME-Version: 1.0
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <1578415992-24054-9-git-send-email-krzk@kernel.org>
In-Reply-To: <1578415992-24054-9-git-send-email-krzk@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 7 Jan 2020 18:10:07 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1RibnRU6SiVjrOy-q+ZDdKacQgD9mrft_aHMgA9hm3PA@mail.gmail.com>
Message-ID: <CAK8P3a1RibnRU6SiVjrOy-q+ZDdKacQgD9mrft_aHMgA9hm3PA@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:Wl3I5GL8oTuHF4B8uEWhwYLx8r7xgnH4MKtioAfPmsSS/JrPJvU
 TG6HFiwedNhpJ6mUOPialIISyutXK5Oog/2XhTpT6MaFdcte+//iRG9NyuQ4EvkOr6NYUOc
 J/U6C4PJ9yfOSIlagB1J0hniPJ5IBQawFd6F2t/LJUu/jofOwL6F3R/nXWUi4BUreCwiRWa
 dSsT0RysLpw37gzjP3tQQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2Hsp65fyom8=:8+N1vr2Y7LksVbpV+rURgY
 sRCECsN0BC1BsiXze+/gfw02sbdTMaulOEIsfGkIOB0tmjf4P6vpqaqB8XGZimUi6+2K8ELsV
 2QA4LooOsVM2xnVNRpkn8nB3mWfO7kmBJ9vkBYJPFOuu8GRyuSo36Z0FW8qOQLAN6rSjZui40
 6kBLK0O7JgQudTjJbMRs/MzmolRZO6FTFBtM+ywS/YQSmasHKi1PVyd7Q0ObS3vIueEgkxYso
 u1nxlbAeddg/u8mk1/YtHc4pAwuwQNKO7R1rrIQ5Zxv/QR8RqA7I+TDcPd4PcTmvhvxvKCAq3
 O7eWpnXOoYcJ78ktb4FMgYfd2V5jZVQKCB1nRW9IxXO3pWDbNnDMjTvxiy/iiEsXwwX99Nnup
 CaygvelmWM1RipvsOXxKo/x9HQYQuu56pHbzuvV4VN9kskJH9VLWmLxfM5FKrvTWeqh0qlU2L
 +0fMPPJT+ohRYh2iV38IPpOevyvBAdzd2Sw4jkvozAD42fULT/g4KulEm5/qonuL9diKYFoGf
 ctnV8IeXgVGEa6EbrTjH7LfnIzZ/jm6fYGqRS0HW2nxjWApnkJf3VNoQg/j9kwVEa5xpugZuZ
 9KjF6e+zN/51bbJS+0+P/S0Cho8JDKv/sxQAK8tfS4YPIPwKPU5/nRPz9a1m5K608Lm37k3Bb
 0JmleIr8B5WOskbzKNtzuC7l8RzWc8ojfP8uQco3BEW0cm/ltkzX+Ybs14uRx99GvJ6rXU/ui
 fXx0tjBYx74fOXXAlJfLwZ+BAs/yLldSFaOnDxkSJeEvsDKvc6mLXTZk4MgkokgAz0sdgUSb5
 IgR0nBK4vjZQwfyfRJ8DgLJtwxFf7yT1sXpPdZApLtcZZJcEqygh8zmHWkHJ6TrKoNpO8wimj
 3tz0OFYK5gC7j1uTNWCw==
X-Mailman-Approved-At: Sat, 11 Jan 2020 19:32:29 +0000
Subject: Re: [Nouveau] [RFT 06/13] arc: Constify ioreadX() iomem argument
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
> Implementations of ioreadX() do not modify the memory under the
> address so they can be converted to a "const" version for const-safety
> and consistency among architectures.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

The patch looks correct, but I would not bother here, as it has no
effect on the compiler or its output.

      Arnd
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
