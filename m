Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABF424C4D4
	for <lists+nouveau@lfdr.de>; Thu, 20 Aug 2020 19:49:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B846E9A1;
	Thu, 20 Aug 2020 17:49:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF0E6E9A1
 for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2020 17:48:31 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id b2so994399edw.5
 for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2020 10:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TdWdmS9KmpqRDKTTx4ZFKlZV0sk8Q5cLOhIOkZ1gD+w=;
 b=cAZtzVYP2n3YvXgVkbJ7dbST+g3SP0UPbXQ9iKKyhX4VXr8jHpSYHqZMaG5ucNVipI
 bzzpnQCIz78GKzn14VpRAj8Y6mpMr87iyH7UMbPsjr5O6z0niDquexdhhjTmn1y5QjQv
 l8iJOpqbyOslL4LKhF6zS+g3cTQ+z78POnoVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TdWdmS9KmpqRDKTTx4ZFKlZV0sk8Q5cLOhIOkZ1gD+w=;
 b=ExMkruJl8Vj6uxifARxKm/qxuFxaKLR3KBHLGRTb/Ur6N+c1ZH74tPs0xqF+Qxub43
 +EpQ5KJbNNQvy6YmO/TcBgjFG0nnOOfi5Us2HP60ywYeA8BlMe2eur6+unIurRqpnNYN
 nP1Wdej/DL+7grolB4RScKHF2ovWTS3MbALRuQ0ISs31EanCpzO2ZDuRrabrHZfYUxu+
 CpqYz6IDLTGt3TFc7NNmtqbPJCGD7ghSxCrmKrlvkCWCoezf+1vJbXC7p5ew6BOh8EKc
 n0A8YdSuiDaBkSV5yEMirehbsrKHgMJ8Yxc2PcZGFPUBn4jADLAyi4yzZUpURKcAzm1f
 1psQ==
X-Gm-Message-State: AOAM531FNcCGLgCGqCm1SANy3tALP2w4FO+YFPz6PJUGoqDZZr7QOJr0
 wNRvv8Wlh5IZwWf4u6B556ou81ik/b570Q==
X-Google-Smtp-Source: ABdhPJyc76KdvU//GkPYhvwZAD02bjNLMK6IIylF7UJcb5yMZ7NozOvish1DAPDezu56erLTGlAFrA==
X-Received: by 2002:a05:6402:305b:: with SMTP id
 bu27mr4054483edb.300.1597945709737; 
 Thu, 20 Aug 2020 10:48:29 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54])
 by smtp.gmail.com with ESMTPSA id cm22sm1757119edb.44.2020.08.20.10.48.29
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2020 10:48:29 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id x5so2438868wmi.2
 for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2020 10:48:29 -0700 (PDT)
X-Received: by 2002:a1c:4d12:: with SMTP id o18mr4512279wmh.55.1597945276327; 
 Thu, 20 Aug 2020 10:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200819065555.1802761-1-hch@lst.de>
 <20200819065555.1802761-6-hch@lst.de>
 <CAAFQd5COLxjydDYrfx47ht8tj-aNPiaVnC+WyQA7nvpW4gs=ww@mail.gmail.com>
 <62e4f4fc-c8a5-3ee8-c576-fe7178cb4356@arm.com>
 <CAAFQd5AcCTDguB2C9KyDiutXWoEvBL8tL7+a==Uo8vj_8CLOJw@mail.gmail.com>
 <2b32f1d8-16f7-3352-40a5-420993d52fb5@arm.com> <20200820050214.GA4815@lst.de>
 <CAAFQd5AknYpP5BamC=wJkEJyO-q47V6Gc+HT65h6B+HyT+-xjQ@mail.gmail.com>
 <20200820165213.GC12693@lst.de>
In-Reply-To: <20200820165213.GC12693@lst.de>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 20 Aug 2020 19:41:03 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BcH-_S=WDvqYvSPxMvQuN5atO8q=xktbMaPS-DOCAYbw@mail.gmail.com>
Message-ID: <CAAFQd5BcH-_S=WDvqYvSPxMvQuN5atO8q=xktbMaPS-DOCAYbw@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Thu, 20 Aug 2020 17:49:07 +0000
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

On Thu, Aug 20, 2020 at 6:52 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Aug 20, 2020 at 12:24:31PM +0200, Tomasz Figa wrote:
> > > Of course this still uses the scatterlist structure with its annoying
> > > mix of input and output parametes, so I'd rather not expose it as
> > > an official API at the DMA layer.
> >
> > The problem with the above open coded approach is that it requires
> > explicit handling of the non-IOMMU and IOMMU cases and this is exactly
> > what we don't want to have in vb2 and what was actually the job of the
> > DMA API to hide. Is the plan to actually move the IOMMU handling out
> > of the DMA API?
> >
> > Do you think we could instead turn it into a dma_alloc_noncoherent()
> > helper, which has similar semantics as dma_alloc_attrs() and handles
> > the various corner cases (e.g. invalidate_kernel_vmap_range and
> > flush_kernel_vmap_range) to achieve the desired functionality without
> > delegating the "hell", as you called it, to the users?
>
> Yes, I guess I could do something in that direction.  At least for
> dma-iommu, which thanks to Robin should be all you'll need in the
> foreseeable future.

That would be really great. Let me know if we can help by testing with
V4L2/vb2 or in any other way.

Best regards,
Tomasz
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
