Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E382794EF
	for <lists+nouveau@lfdr.de>; Sat, 26 Sep 2020 01:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F126ED7E;
	Fri, 25 Sep 2020 23:46:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C376E08A
 for <nouveau@lists.freedesktop.org>; Fri, 25 Sep 2020 18:47:16 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id b79so4487280wmb.4
 for <nouveau@lists.freedesktop.org>; Fri, 25 Sep 2020 11:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=g/BH1U9GUunsIrnO/GbdPQWxTeH46s0MtJm8Rv2PmQg=;
 b=dRgYAI+Il/XnGvkuGcGG/lsBUKoJIpFGsPVq7bdfwYbSWBuKZWhEyZ/C6V2T06d7l+
 MlGVte7aAMEe5kn/Xzgvbo6wkmehHB6utltBuTWLjuy10bgK9jfUtimOpRmqNVZ/PDb7
 pPEsfddSQturiPpnwk/9j/tF8/GG+ViphzAqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=g/BH1U9GUunsIrnO/GbdPQWxTeH46s0MtJm8Rv2PmQg=;
 b=CvkKGSgbNyv5QMWK6reDZ/3zzbrIZ6vF/7WTNa2NMd5GNb7ABt0Is9gbPnqQeJVBn4
 lsUXrVd3MYx7zdmFcuu54ABnpUCoBuNGDgv84RyDLpIwIzDHXcmRrOPlKkNEvNbHwDbI
 li9/42b6sn12fmDvf31nOkuMXRic3mZSdUHztnRktw9/lebMeOpsqVfVAqLvh2gQkgsP
 XiBOQT41+vpBEajg9XdGtOZ3irhS3DXcHce+zOQA2V5Y0pBIYI1JuPpXh/vDjoZVlc5k
 hZO8YCEEeGetpDxdm5Ras/ciM1dlffdBB8FWwYY+eVMA1P3mkoNmwS8FOG3uD7QFWLQd
 8SsQ==
X-Gm-Message-State: AOAM532OvY6uJjxwC+1IhidpQurXpOVKCCiLBJDAKPp9eq+BSaa88QbN
 CnnNH6jDXOKJ2f8isdZMyDBr/w==
X-Google-Smtp-Source: ABdhPJwizv9lDNCgaSezSHmDHMwhCyQSsePLifiuaYRBnBvcSMHXRWloRU3D/0rZv64JO/qSChFcJg==
X-Received: by 2002:a1c:2d86:: with SMTP id t128mr4754086wmt.189.1601059634661; 
 Fri, 25 Sep 2020 11:47:14 -0700 (PDT)
Received: from chromium.org (216.131.76.34.bc.googleusercontent.com.
 [34.76.131.216])
 by smtp.gmail.com with ESMTPSA id w15sm3841044wro.46.2020.09.25.11.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 11:47:13 -0700 (PDT)
Date: Fri, 25 Sep 2020 18:47:12 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200925184712.GC3607091@chromium.org>
References: <20200915155122.1768241-1-hch@lst.de>
 <20200915155122.1768241-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915155122.1768241-2-hch@lst.de>
X-Mailman-Approved-At: Fri, 25 Sep 2020 23:46:15 +0000
Subject: Re: [Nouveau] [PATCH 01/18] media/v4l2: remove
 V4L2-FLAG-MEMORY-NON-CONSISTENT flag
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
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 linux-mm@kvack.org, linux1394-devel@lists.sourceforge.net,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, linux-scsi@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, Matt Porter <mporter@kernel.crashing.org>,
 linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 iommu@lists.linux-foundation.org, Stefan Richter <stefanr@s5r6.in-berlin.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Christoph,

On Tue, Sep 15, 2020 at 05:51:05PM +0200, Christoph Hellwig wrote:
> From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> 
> The patch partially reverts some of the UAPI bits of the buffer
> cache management hints. Namely, the queue consistency (memory
> coherency) user-space hint because, as it turned out, the kernel
> implementation of this feature was misusing DMA_ATTR_NON_CONSISTENT.
> 
> The patch revers both kernel and user space parts: removes the
> DMA consistency attr functions, rollbacks changes to v4l2_requestbuffers,
> v4l2_create_buffers structures and corresponding UAPI functions
> (plus compat32 layer) and cleanups the documentation.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  .../userspace-api/media/v4l/buffer.rst        | 17 -------
>  .../media/v4l/vidioc-create-bufs.rst          |  6 +--
>  .../media/v4l/vidioc-reqbufs.rst              | 12 +----
>  .../media/common/videobuf2/videobuf2-core.c   | 46 +++----------------
>  .../common/videobuf2/videobuf2-dma-contig.c   | 19 --------
>  .../media/common/videobuf2/videobuf2-dma-sg.c |  3 +-
>  .../media/common/videobuf2/videobuf2-v4l2.c   | 18 +-------
>  drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 10 +---
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  5 +-
>  include/media/videobuf2-core.h                |  7 +--
>  include/uapi/linux/videodev2.h                | 13 +-----
>  11 files changed, 22 insertions(+), 134 deletions(-)

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
