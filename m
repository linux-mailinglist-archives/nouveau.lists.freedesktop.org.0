Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6887024BBEF
	for <lists+nouveau@lfdr.de>; Thu, 20 Aug 2020 14:36:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC656E334;
	Thu, 20 Aug 2020 12:36:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31E96E119
 for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2020 10:24:47 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id c16so1822846ejx.12
 for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2020 03:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FU3+CiJFzLHmOFDuQMwlaisWRGuHRN+5AV6txupwZrU=;
 b=QFNCCjnhRiVXX1RwHJMrjJrm3FMIDmNx/PgDGVaGoYPr2orRHBTBO48N0vE/bjgnJ+
 SYuYytDiRhiYZtZgJZ7z4/4vPKus2MwWgTKmnlMmLZQ4o8gAgDqGKHg0dO0uTStdh95b
 tHYxvzFh9iEVHBmlKA/EhqmNwNT52r2I3xUhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FU3+CiJFzLHmOFDuQMwlaisWRGuHRN+5AV6txupwZrU=;
 b=H9iR53R352XIJsoJWDYJEAYdMen2cbFEInSGndGRrMlWawYahWn9ydjhe4V2107zqW
 kawonuRYxqlcaGBSrTwKwiJhCCLEr6ulIpyZqdObhKimdmf25Tdn+AhoNLIopmItEFjt
 +Q0mMBIIsQtYOPu5VurcVZNzl1MPdMYhj58VmD4Xl4buZATgGZyKd9CgjZtwxswrxVvC
 31LqpwZbXv36S8m3kMSvadiovhSH/cj57TcjJU2dIbisXQC3/bEo5Fehdp47P53+j54l
 EWALnY8A/vjvRmNEvPbWIqmSkAMzPXtfmrT+6uBGZysTFJySzNocohiB3Qd3XzIciFdL
 kGkA==
X-Gm-Message-State: AOAM532FNH3R2096qkEfGcs2jb/ffAK8t4co6GTsiFVXntFxWoeN9tbO
 EejXCRGFcsZebjOehcFs2K/f7f26ZoQ1LjDv
X-Google-Smtp-Source: ABdhPJyxfXzfXa3oIZxaM9hahQ8502UZOQslrs+ryIJNmhA5gEAVch2txqV+NGu9r9s/whNeED1oEw==
X-Received: by 2002:a17:906:fa0b:: with SMTP id
 lo11mr2632960ejb.235.1597919086184; 
 Thu, 20 Aug 2020 03:24:46 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53])
 by smtp.gmail.com with ESMTPSA id j11sm1170016ejx.0.2020.08.20.03.24.45
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2020 03:24:45 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id a15so1475451wrh.10
 for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2020 03:24:45 -0700 (PDT)
X-Received: by 2002:a5d:6744:: with SMTP id l4mr2717742wrw.105.1597919084826; 
 Thu, 20 Aug 2020 03:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200819065555.1802761-1-hch@lst.de>
 <20200819065555.1802761-6-hch@lst.de>
 <CAAFQd5COLxjydDYrfx47ht8tj-aNPiaVnC+WyQA7nvpW4gs=ww@mail.gmail.com>
 <62e4f4fc-c8a5-3ee8-c576-fe7178cb4356@arm.com>
 <CAAFQd5AcCTDguB2C9KyDiutXWoEvBL8tL7+a==Uo8vj_8CLOJw@mail.gmail.com>
 <2b32f1d8-16f7-3352-40a5-420993d52fb5@arm.com> <20200820050214.GA4815@lst.de>
In-Reply-To: <20200820050214.GA4815@lst.de>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 20 Aug 2020 12:24:31 +0200
X-Gmail-Original-Message-ID: <CAAFQd5AknYpP5BamC=wJkEJyO-q47V6Gc+HT65h6B+HyT+-xjQ@mail.gmail.com>
Message-ID: <CAAFQd5AknYpP5BamC=wJkEJyO-q47V6Gc+HT65h6B+HyT+-xjQ@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Thu, 20 Aug 2020 12:36:49 +0000
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

On Thu, Aug 20, 2020 at 7:02 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Aug 19, 2020 at 03:07:04PM +0100, Robin Murphy wrote:
> >> FWIW, I asked back in time what the plan is for non-coherent
> >> allocations and it seemed like DMA_ATTR_NON_CONSISTENT and
> >> dma_sync_*() was supposed to be the right thing to go with. [2] The
> >> same thread also explains why dma_alloc_pages() isn't suitable for the
> >> users of dma_alloc_attrs() and DMA_ATTR_NON_CONSISTENT.
> >
> > AFAICS even back then Christoph was implying getting rid of NON_CONSISTENT
> > and *replacing* it with something streaming-API-based - i.e. this series -
> > not encouraging mixing the existing APIs. It doesn't seem impossible to
> > implement a remapping version of this new dma_alloc_pages() for
> > IOMMU-backed ops if it's really warranted (although at that point it seems
> > like "non-coherent" vb2-dc starts to have significant conceptual overlap
> > with vb2-sg).
>
> You can alway vmap the returned pages from dma_alloc_pages, but it will
> make cache invalidation hell - you'll need to use
> invalidate_kernel_vmap_range and flush_kernel_vmap_range to properly
> handle virtually indexed caches.
>
> Or with remapping you mean using the iommu do de-scatter/gather?

Ideally, both.

For remapping in the CPU sense, there are drivers which rely on a
contiguous kernel mapping of the vb2 buffers, which was provided by
dma_alloc_attrs(). I think they could be reworked to work on single
pages, but that would significantly complicate the code. At the same
time, such drivers would actually benefit from a cached mapping,
because they often have non-bursty, random access patterns.

Then, in the IOMMU sense, the whole idea of videobuf2-dma-contig is to
rely on the DMA API to always provide device-contiguous memory, as
required by the hardware which only has a single pointer and size.

>
> You can implement that trivially implement it yourself for the iommu
> case:
>
> {
>         merge_boundary = dma_get_merge_boundary(dev);
>         if (!merge_boundary || merge_boundary > chunk_size - 1) {
>                 /* can't coalesce */
>                 return -EINVAL;
>         }
>
>
>         nents = DIV_ROUND_UP(total_size, chunk_size);
>         sg = sgl_alloc();
>         for_each_sgl() {
>                 sg->page = __alloc_pages(get_order(chunk_size))
>                 sg->len = chunk_size;
>         }
>         dma_map_sg(sg, DMA_ATTR_SKIP_CPU_SYNC);
>         // you are guaranteed to get a single dma_addr out
> }
>
> Of course this still uses the scatterlist structure with its annoying
> mix of input and output parametes, so I'd rather not expose it as
> an official API at the DMA layer.

The problem with the above open coded approach is that it requires
explicit handling of the non-IOMMU and IOMMU cases and this is exactly
what we don't want to have in vb2 and what was actually the job of the
DMA API to hide. Is the plan to actually move the IOMMU handling out
of the DMA API?

Do you think we could instead turn it into a dma_alloc_noncoherent()
helper, which has similar semantics as dma_alloc_attrs() and handles
the various corner cases (e.g. invalidate_kernel_vmap_range and
flush_kernel_vmap_range) to achieve the desired functionality without
delegating the "hell", as you called it, to the users?

Best regards,
Tomasz
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
