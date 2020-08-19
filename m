Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8FB24A0DB
	for <lists+nouveau@lfdr.de>; Wed, 19 Aug 2020 15:59:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B02892C2;
	Wed, 19 Aug 2020 13:59:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D213892C2
 for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2020 13:58:18 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id w17so18155379edt.8
 for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2020 06:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6xkguvOzsgzZf/2nZcmiUdLktaalZbMKG8kwCTKJnbQ=;
 b=m4IkKgPlDJh9Ow/m1Q5dtgZrYLnaRCS7od5vd7CevPl4aSkNJcXDYSbofI9IVrnSM1
 T0Nk8lAEv28vGxYfqJpLVc+ygPg3eNS610ZSiKpYmXTIZXUzbw+fr6qoGPkql89ad0SH
 sz82upHUpsjkfyqDK6oYGAHuFg3NLWv3KpWnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6xkguvOzsgzZf/2nZcmiUdLktaalZbMKG8kwCTKJnbQ=;
 b=BD7T4q5qPbgfaO4Y8dqcNUgImF3pMNqSwAKUbxA1HcgvX6hSYk33XXK999BDA4QXxm
 rKyRq24g6U8crgA/KeAbZr1l7S/xQwGclG4VBkOwM27OxjQzPoXSY5KjxxUr+fa8s53B
 KjhXSgMBYVhS+vn0r+nMU1BZ6qA/Wlh/VMHreDcHPAMhhfHoH/OHoYW7bgbKw2/STlue
 FCGsus5GY7J7LSiHqpm8+1q9scgeZYKCKT8CCrKGTPbff4MJNDmSGML1GXv5+ffsK/kQ
 MJImCU2+2yvQX2RUkUp9U8nJD4SYkdHjH7cmXlM6YZm9YQEhEIkGWgc8JnuK5IogeOls
 CtQw==
X-Gm-Message-State: AOAM533f5V/n6pVtqJ0epjSzDiZmpUNV+1UvLJoZNSJeIJKH6tIwoUCg
 n0ZL3ZXJOmbbpqxgnzT4PID45C6ZaoXzfw==
X-Google-Smtp-Source: ABdhPJxxK9T9HIi4XauwE95ipZw7d5w14R6/rrr1ha9o1K21ns6LA6f5l7m3/e8bX37FxHo0mfOzEg==
X-Received: by 2002:aa7:cd46:: with SMTP id v6mr23516414edw.21.1597845495738; 
 Wed, 19 Aug 2020 06:58:15 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
 [209.85.128.44])
 by smtp.gmail.com with ESMTPSA id k10sm18899166ejj.108.2020.08.19.06.58.10
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2020 06:58:11 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id t14so2314298wmi.3
 for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2020 06:58:10 -0700 (PDT)
X-Received: by 2002:a1c:5581:: with SMTP id j123mr5137250wmb.11.1597845489930; 
 Wed, 19 Aug 2020 06:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200819065555.1802761-1-hch@lst.de>
 <20200819065555.1802761-6-hch@lst.de>
 <CAAFQd5COLxjydDYrfx47ht8tj-aNPiaVnC+WyQA7nvpW4gs=ww@mail.gmail.com>
 <20200819135454.GA17098@lst.de>
In-Reply-To: <20200819135454.GA17098@lst.de>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 19 Aug 2020 15:57:53 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BuXP7t3d-Rwft85j=KTyXq7y4s24mQxLr=VoY9krEGZw@mail.gmail.com>
Message-ID: <CAAFQd5BuXP7t3d-Rwft85j=KTyXq7y4s24mQxLr=VoY9krEGZw@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Wed, 19 Aug 2020 13:58:58 +0000
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, linux-scsi@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Matt Porter <mporter@kernel.crashing.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Pawel Osciak <pawel@osciak.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-mips@vger.kernel.org,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Aug 19, 2020 at 3:55 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Aug 19, 2020 at 01:16:51PM +0200, Tomasz Figa wrote:
> > Hi Christoph,
> >
> > On Wed, Aug 19, 2020 at 8:56 AM Christoph Hellwig <hch@lst.de> wrote:
> > >
> > > The V4L2-FLAG-MEMORY-NON-CONSISTENT flag is entirely unused,
> >
> > Could you explain what makes you think it's unused? It's a feature of
> > the UAPI generally supported by the videobuf2 framework and relied on
> > by Chromium OS to get any kind of reasonable performance when
> > accessing V4L2 buffers in the userspace.
>
> Because it doesn't do anything except on PARISC and non-coherent MIPS,
> so by definition it isn't used by any of these media drivers.

It's still an UAPI feature, so we can't simply remove the flag, it
must stay there as a no-op, until the problem is resolved.

Also, it of course might be disputable as an out-of-tree usage, but
selecting CONFIG_DMA_NONCOHERENT_CACHE_SYNC makes the flag actually do
something on other platforms, including ARM64.

Best regards,
Tomasz
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
