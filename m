Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3641224A182
	for <lists+nouveau@lfdr.de>; Wed, 19 Aug 2020 16:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C996E3FB;
	Wed, 19 Aug 2020 14:17:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975606E3A6
 for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2020 14:12:12 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id c16so26449691ejx.12
 for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2020 07:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/Js4y14Ghs6Bq4zdQYDVHKruVAGVzHlKISQN4bMebSg=;
 b=dV/u8lgzRJf9R13RTyQNVA0z7K0gpop908KdbH7mh1lom7wOwawyDuMH4lJJUnAt3N
 ER1Hz91rD7vCxhZyzb6LHpsKYbaB2LKK6Ns95j0nfjmJX5hZXauljIjL3//YJqgWaxRv
 97QHf+SgHVXKKphnPxr8+LnwmzFET6Ce2ARqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Js4y14Ghs6Bq4zdQYDVHKruVAGVzHlKISQN4bMebSg=;
 b=imcroKek5zk/LnD+Os60q3P0bPLZRVBFxGqOQgXXnJUdttqzwhkK3WX8vtMXM3t/xW
 u+ww8edSCFzD5kkOpyL6kG+mWtCWfFTsAxvJIATg7W4RzdV5CSZLHxuR2tjmv74OQN3J
 hBynAsR7aTok8XWZ/rXg1+domwCB9nDcMa7eRoRt+KObhubfpISi8RMhp88HMwICttzr
 4MOgUL4n7FUVMhb+fg7hLmrNlsSe6+mt2KE/W+N1kFMsl0NcT6r1vlFCxM7WZpYTw1LG
 8fJY2j04TKdHpJ3vPEKw/EtigBAriuBNX3HT+eerq1BTVmMbtM4UiwWa5whihbdvzb7H
 J6wQ==
X-Gm-Message-State: AOAM533yaNeL7inm6L3wGqcIrrBcJY6UJp8W/XfjITKq6cZUm5AUWDH6
 QiDSDX7Hmp93jEQmeQ8NoNgXtSApoYi4kw==
X-Google-Smtp-Source: ABdhPJx6WuTFMcRBU1Vu3xEq8sn3zsrIC2P3x8+THT7VH2OaQJ04QMGvSdbDr5f6+/o6zEUydzWkjA==
X-Received: by 2002:a17:906:824d:: with SMTP id
 f13mr26342978ejx.190.1597846330886; 
 Wed, 19 Aug 2020 07:12:10 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54])
 by smtp.gmail.com with ESMTPSA id a18sm18872450ejt.69.2020.08.19.07.12.09
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2020 07:12:09 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id l2so21678353wrc.7
 for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2020 07:12:09 -0700 (PDT)
X-Received: by 2002:adf:ec4f:: with SMTP id w15mr24104550wrn.385.1597846328915; 
 Wed, 19 Aug 2020 07:12:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200819065555.1802761-1-hch@lst.de>
 <20200819065555.1802761-6-hch@lst.de>
 <CAAFQd5COLxjydDYrfx47ht8tj-aNPiaVnC+WyQA7nvpW4gs=ww@mail.gmail.com>
 <62e4f4fc-c8a5-3ee8-c576-fe7178cb4356@arm.com>
 <CAAFQd5AcCTDguB2C9KyDiutXWoEvBL8tL7+a==Uo8vj_8CLOJw@mail.gmail.com>
 <20200819135738.GB17098@lst.de>
In-Reply-To: <20200819135738.GB17098@lst.de>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 19 Aug 2020 16:11:52 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BvpzJTycFvjntmX9W_d879hHFX+rJ8W9EK6+6cqFaVMA@mail.gmail.com>
Message-ID: <CAAFQd5BvpzJTycFvjntmX9W_d879hHFX+rJ8W9EK6+6cqFaVMA@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Wed, 19 Aug 2020 14:17:10 +0000
Subject: Re: [Nouveau] [PATCH 05/28] media/v4l2: remove
 V4L2-FLAG-MEMORY-NON-CONSISTENT
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
Cc: alsa-devel@alsa-project.org, linux-ia64@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 nouveau@lists.freedesktop.org, linux-nvme@lists.infradead.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, linux-scsi@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Ben Skeggs <bskeggs@redhat.com>, Matt Porter <mporter@kernel.crashing.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Pawel Osciak <pawel@osciak.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Aug 19, 2020 at 3:57 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Aug 19, 2020 at 02:49:01PM +0200, Tomasz Figa wrote:
> > With the default config it doesn't, but with
> > CONFIG_DMA_NONCOHERENT_CACHE_SYNC enabled it makes dma_pgprot() keep
> > the pgprot value as is, without enforcing coherence attributes.
>
> Which isn't selected on arm64, and that is for a good reason.
>
> > AFAIK dma_cache_sync() isn't the only way to perform the cache
> > synchronization.
>
> Yes, it is the only documented way to do it.  And if you read the whole
> series instead of screaming you'd see that it provides a proper way
> to deal with non-coherent memory which will also work with arm64.
> instead of screaming
>

I'm sorry if I have offended you in any way, but would also appreciate
it if a less aggressive tone was directed towards me as well.

I have valid reasons to object to this patch, as stated in my previous
emails. The fact that the original feature has problems is of course
another story and, as I mentioned too, I'm willing to look into fixing
them.

I'm of course happy to review the rest of the series and even more
happy to help migrating this code to whatever is added there, as long
as the functionality is preserved.

> > By the way, as a videobuf2 reviewer, I'd appreciate being CC'd on any
> > series related to the subsystem-facing DMA API changes, since
> > videobuf2 is one of the biggest users of it.
>
> The cc list is too long - I cc lists and key maintainers.  As a reviewer
> should should watch your subsystems lists closely.

Well, I guess we can disagree on this, because there is no clear
policy. I'm listed in the MAINTAINERS file for the subsystem and I
believe the purpose of the file is to list the people to CC on
relevant patches. We're all overloaded with work and having to look
through the huge volume of mailing lists like linux-media doesn't help
and thus I'd still appreciate being added on CC.

Best regards,
Tomasz
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
