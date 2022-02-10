Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E00EC4B1CEF
	for <lists+nouveau@lfdr.de>; Fri, 11 Feb 2022 04:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 847D610E9F3;
	Fri, 11 Feb 2022 03:28:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF1A10E7B7
 for <nouveau@lists.freedesktop.org>; Thu, 10 Feb 2022 09:40:12 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id j2so13864702ybu.0
 for <nouveau@lists.freedesktop.org>; Thu, 10 Feb 2022 01:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vwSyjkWA8Xtx6McE/937H/83En/EAsN4/n12OaGn97U=;
 b=Q9U5MhFM50SJ6zKg3p/BHPAbW/1PqWiV8IwLRh7eYuvqYsefXz7JVtkApiN0D5tJs9
 NjgtZ08Kif7nIin7P9Lj3k6IR7GOTseT9s5laCSNNmTWHD2uCXfrqGfuutVuti7FabYq
 BBBAb4MnvkLH4UJThCTrI8+/mOnZaltJr+bpG6t9FkMSJZxm2G82RI22ShxjcihlxEsi
 Y82w37OnLpB5Xi9WU56u6QA7+3qLoNq0E7XxjqXpD9HrhneWbPs+sNufIntIIK3bmpgw
 cO6+9m8+iutxaFYcQMGptKVxtMwZN8MAWIOLV4hGp2W+29wbPx10LCsVwxL/brPe2+Mu
 8Ffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vwSyjkWA8Xtx6McE/937H/83En/EAsN4/n12OaGn97U=;
 b=SDFlDvSUfmRMpxjLMZDjIi2mUE3oMXXyOSA8q/ia+NE9G8URZY9EIdqmg0dzhqwV2S
 mzrqFkByI6/RHij/x9Az50UWvfxUK4xpU1JhF3UwrxjFEuVdYd0GuaNWkTlbWHNuWGrc
 P4XXT2GiKNOcFqGfwVYVdD6A8ptDP1dzW31wcFeJXkouyRvkdIE5Opg56UL6+vq7bNHi
 4FMLyLaAHMbCAA8utsoxnbCRFrshh0KtwYRWSM3SV+ZGEauswxpOmoE+90AGBdOZSLki
 POpAVVe9CUv9dBz1be8Fq8Zwe3Eq91wv9C7KX97yz8V79BzT00Jwsyclo4vTGnKqmulV
 vjjQ==
X-Gm-Message-State: AOAM530M6jvdcY3lq9L60yv8G+cluGQ/z1yLbR7VH4EcCzI5ljBC5jSI
 N2xkLAXo9Esd1Sf3AOjpoPwsblZGM2mT4ygmQMxWww==
X-Google-Smtp-Source: ABdhPJyMOovS5IpsBIbmJvgp0LJOskYVPag8axtaKArSDLNMC4EYiKcUxfRUU3qBQ8ccmcQ6MqVRs4tbRTDCogGg4e4=
X-Received: by 2002:a25:4742:: with SMTP id u63mr6032141yba.523.1644486011092; 
 Thu, 10 Feb 2022 01:40:11 -0800 (PST)
MIME-Version: 1.0
References: <20220210072828.2930359-1-hch@lst.de>
 <20220210072828.2930359-4-hch@lst.de>
In-Reply-To: <20220210072828.2930359-4-hch@lst.de>
From: Muchun Song <songmuchun@bytedance.com>
Date: Thu, 10 Feb 2022 17:39:34 +0800
Message-ID: <CAMZfGtWb9a8gN7DjaJngYi4aJLVHL74eKnXmctXC27QyarHsDQ@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 11 Feb 2022 03:28:13 +0000
Subject: Re: [Nouveau] [PATCH 03/27] mm: remove pointless includes from
 <linux/hmm.h>
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
Cc: nvdimm@lists.linux.dev, Ralph Campbell <rcampbell@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 nouveau@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Alex Deucher <alexander.deucher@amd.com>,
 Chaitanya Kulkarni <kch@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>, Dan Williams <dan.j.williams@intel.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Feb 10, 2022 at 3:28 PM Christoph Hellwig <hch@lst.de> wrote:
>
> hmm.h pulls in the world for no good reason at all.  Remove the
> includes and push a few ones into the users instead.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>
