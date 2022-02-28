Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 290424C826A
	for <lists+nouveau@lfdr.de>; Tue,  1 Mar 2022 05:37:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 416F410EB44;
	Tue,  1 Mar 2022 04:37:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5529410E67A
 for <nouveau@lists.freedesktop.org>; Mon, 28 Feb 2022 20:15:06 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id d23so23274904lfv.13
 for <nouveau@lists.freedesktop.org>; Mon, 28 Feb 2022 12:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rhevy6fb5H45VxDHjLDNCxtPhjJ0u7uFLdfSx9pxlIs=;
 b=SFiiDaskyFzzbW4jCoUqiJYglpNWscp1lwtLHE93w8dRI3h8eXZkrLgebAKqQfA9oZ
 haXikdZXvfEB810zRURGwChdn/CvMC8Q7Pab3hpE0iVI/nf3FVJvcryQMcC1uZhcoZUU
 P6IZH9h2w6s9V+B5fc5q6pR5l/tJkcQrm5JJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rhevy6fb5H45VxDHjLDNCxtPhjJ0u7uFLdfSx9pxlIs=;
 b=uo6GM13r282qnrH3y7+oaQ+rmekvJE7LbqHzUe2Ny0omaeeGuyoUmGRKcphac7hUmD
 tLpmB5YOmdrbHy2gxFQQA3zcJirCyAjFl472XauJka/AQJ55EWU298X+w285ZSJPoGz3
 7a7lVMMA15xcV+fBWmnSckgSy07aQ/rAXlmumN23+v1A03+fvnPSyeA4K1w/GiOBrc5E
 Ca/KJxHfhOPyMU/g5W0bw027dis7u0gC4P0frE+cTIaL46wEoymlJIfJtRD8KSXJK6qU
 2q82qzs3tY5jXSx17SZIWTUFv2YZEWYZqXcWCtgtf13uvaXzS8wwCXY7DGXzccCqnQkA
 Gcvw==
X-Gm-Message-State: AOAM531kU4+6hvw3AHEfE4PLh+4x/utzep5m4a6xrJQUba8XeBLRT+Zw
 9QmOVYvsIWiFqAr/RhZY9lIjWRB0tqtOCknlCu4=
X-Google-Smtp-Source: ABdhPJx7t7wS/wqy1thJuAckMjSc8BbGlQj8C8seAoQvYYytzmHHhA/L9KXxtBv4tQ/bDau9bImuBQ==
X-Received: by 2002:a05:6512:2097:b0:443:eaaa:3ddb with SMTP id
 t23-20020a056512209700b00443eaaa3ddbmr13373662lfr.185.1646079304351; 
 Mon, 28 Feb 2022 12:15:04 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169]) by smtp.gmail.com with ESMTPSA id
 g13-20020a2ea4ad000000b0023382d8819esm1468754ljm.69.2022.02.28.12.15.01
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 12:15:01 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id u7so18971493ljk.13
 for <nouveau@lists.freedesktop.org>; Mon, 28 Feb 2022 12:15:01 -0800 (PST)
X-Received: by 2002:a2e:924d:0:b0:246:370c:5618 with SMTP id
 v13-20020a2e924d000000b00246370c5618mr15110351ljg.358.1646079300900; Mon, 28
 Feb 2022 12:15:00 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
In-Reply-To: <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Feb 2022 12:14:44 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj27SZQ3kPTesBzkiGhe-mA3gOQqr_adt_bMFzmg1VNaA@mail.gmail.com>
Message-ID: <CAHk-=wj27SZQ3kPTesBzkiGhe-mA3gOQqr_adt_bMFzmg1VNaA@mail.gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 01 Mar 2022 04:37:20 +0000
Subject: Re: [Nouveau] [PATCH 2/6] treewide: remove using list iterator
 after loop body as a ptr
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 alsa-devel@alsa-project.org, KVM list <kvm@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 linux-aspeed@lists.ozlabs.org, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org, kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, dma <dmaengine@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, v9fs-developer@lists.sourceforge.net,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sgx@vger.kernel.org,
 linux-block <linux-block@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 linux-usb@vger.kernel.org, samba-technical@lists.samba.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 tipc-discussion@lists.sourceforge.net,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Feb 28, 2022 at 12:10 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> We can do
>
>         typeof(pos) pos
>
> in the 'for ()' loop, and never use __iter at all.
>
> That means that inside the for-loop, we use a _different_ 'pos' than outside.

The thing that makes me throw up in my mouth a bit is that in that

        typeof(pos) pos

the first 'pos' (that we use for just the typeof) is that outer-level
'pos', IOW it's a *different* 'pos' than the second 'pos' in that same
declaration that declares the inner level shadowing new 'pos'
variable.

If I was a compiler person, I would say "Linus, that thing is too ugly
to live", and I would hate it. I'm just hoping that even compiler
people say "that's *so* ugly it's almost beautiful".

Because it does seem to work. It's not pretty, but hey, it's not like
our headers are really ever be winning any beauty contests...

                Linus
