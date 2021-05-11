Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 650C437B595
	for <lists+nouveau@lfdr.de>; Wed, 12 May 2021 07:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573A66E049;
	Wed, 12 May 2021 05:46:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C4889E86
 for <nouveau@lists.freedesktop.org>; Tue, 11 May 2021 16:48:17 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id q2so16445223pfh.13
 for <nouveau@lists.freedesktop.org>; Tue, 11 May 2021 09:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k6jrKLJf+SUK032/zz9tWYcN5Rhay3mFZvhqIWgxNBs=;
 b=L/Y31OZjVAvXas4gAOFGDpY1O+WckxTleHtLR2a6rScOLannRZ4axVg75JGljNN3EA
 40xB287W01zuvyDHYZFS2WLSs1CG9A82KNV8OVT7o92X2FrRRw8J292qbL27/DexCkE7
 qg4XvM9gaQyzYYNGyObKTqbnr0WqygwnwiYxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k6jrKLJf+SUK032/zz9tWYcN5Rhay3mFZvhqIWgxNBs=;
 b=CHQ2xhWPHQPVyBMbNNZnOlDSn0dVcjXIvwLQSqj98iPhRxzz1wqgk77gFWzHzIc55c
 p1alCZ8sEvLi3yqKFLiT4uWkyarT2pPTCSKeR8MCDHPlk2/4eNO988GvLNoKeaVDtR6o
 HsXd0zq/VU6l97Pt2N0r7nNmpyfMOaKjfHT8YFZEhtpqmJ8cZDFlmb5iyQpelyvJ1e4/
 YTEAhuepvCYz2nGXCTsKNSlhwWLZwTOXt7uabnvq8pcZaZ0bIr4JfL6rVRWQCpcPBl5b
 S57LCX6otpmpff1JR57BmU743r+7qvTdDOZPvLOvgweJFPIGj8E/VM0avvc3lMrPZZJ2
 X7Bw==
X-Gm-Message-State: AOAM533ZqAxSh/Yo64JjPp3pTt89wCEP6COJrP6Kr2mM4vRuZUE5d8q6
 kz3c1Fgs1HabIxrMpfAgmWah2WrLdupRiw==
X-Google-Smtp-Source: ABdhPJyFKPUC/k9LALUfhHMTlLs9u1iBkl9Q+jE570OEh0pmgYgvXeaphMv7TPEioEyMo+ENoppuvg==
X-Received: by 2002:a63:4c66:: with SMTP id m38mr31679805pgl.157.1620751697164; 
 Tue, 11 May 2021 09:48:17 -0700 (PDT)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com.
 [209.85.210.177])
 by smtp.gmail.com with ESMTPSA id 130sm13326475pfy.75.2021.05.11.09.48.16
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 09:48:16 -0700 (PDT)
Received: by mail-pf1-f177.google.com with SMTP id v191so16470708pfc.8
 for <nouveau@lists.freedesktop.org>; Tue, 11 May 2021 09:48:16 -0700 (PDT)
X-Received: by 2002:a6b:7b08:: with SMTP id l8mr22174004iop.50.1620751352978; 
 Tue, 11 May 2021 09:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210510095026.3477496-1-tientzu@chromium.org>
 <20210510095026.3477496-6-tientzu@chromium.org>
 <20210510150342.GD28066@lst.de>
In-Reply-To: <20210510150342.GD28066@lst.de>
From: Claire Chang <tientzu@chromium.org>
Date: Wed, 12 May 2021 00:42:22 +0800
X-Gmail-Original-Message-ID: <CALiNf2_7mHuMG5DTQD0GsriN=vuX0ytyUn4rxEmsK2iP3PKV+w@mail.gmail.com>
Message-ID: <CALiNf2_7mHuMG5DTQD0GsriN=vuX0ytyUn4rxEmsK2iP3PKV+w@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Wed, 12 May 2021 05:46:37 +0000
Subject: Re: [Nouveau] [PATCH v6 05/15] swiotlb: Add a new get_io_tlb_mem
 getter
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, benh@kernel.crashing.org,
 joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 Jianxiong Gao <jxgao@google.com>, Daniel Vetter <daniel@ffwll.ch>,
 Will Deacon <will@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 jani.nikula@linux.intel.com, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, Bjorn Helgaas <bhelgaas@google.com>,
 boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, nouveau@lists.freedesktop.org,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, May 10, 2021 at 11:03 PM Christoph Hellwig <hch@lst.de> wrote:
>
> > +static inline struct io_tlb_mem *get_io_tlb_mem(struct device *dev)
> > +{
> > +#ifdef CONFIG_DMA_RESTRICTED_POOL
> > +     if (dev && dev->dma_io_tlb_mem)
> > +             return dev->dma_io_tlb_mem;
> > +#endif /* CONFIG_DMA_RESTRICTED_POOL */
> > +
> > +     return io_tlb_default_mem;
>
> Given that we're also looking into a not addressing restricted pool
> I'd rather always assign the active pool to dev->dma_io_tlb_mem and
> do away with this helper.

Where do you think is the proper place to do the assignment? First
time calling swiotlb_map? or in of_dma_configure_id?
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
