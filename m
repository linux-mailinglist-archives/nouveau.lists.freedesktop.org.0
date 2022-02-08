Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DE84B01BC
	for <lists+nouveau@lfdr.de>; Thu, 10 Feb 2022 02:00:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B0110E720;
	Thu, 10 Feb 2022 01:00:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D76410E25E
 for <nouveau@lists.freedesktop.org>; Tue,  8 Feb 2022 08:09:40 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id 192so21392036ybd.10
 for <nouveau@lists.freedesktop.org>; Tue, 08 Feb 2022 00:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DC5h5QPa2MMSD8jMuUZaOZTMv0rKCEv7tr+WwakctiM=;
 b=UKt/5gqtEQEDR+I4jR//5bWv57hPVaW9KmAr8xHRshFW+V9PDSWkFrBE8Hyb8wlSkA
 QQKQ+stzgyEgp5J4DyVY4bvPNBtHP4wSzJ6uJck+8cplu8GPkuIVWQ+Y8zm1xv27s0Zu
 cR2ljgqob8w9EmBGVw0EdJVkId5N+xNPUHeADg5epuSLdcXTrW9Tqo5OcA22EaRu8U3K
 l3cuLzKBbOc9GbQXk+h497gXyT6KtsqpW966ysKE5jotsGOXr7l3B+dKnggATk5GoyUy
 KJOt1xwxzqYiEqEVIBRmXg0oLWnTj4m1q1+iR+FtOucXjtQu9GfhLJMBe3O/kYgazNfR
 tnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DC5h5QPa2MMSD8jMuUZaOZTMv0rKCEv7tr+WwakctiM=;
 b=WIcSLQomuD5uFEk+UiRhtdXGFApIehUg5Ajob/TONtQirjmwNObrE98v4BHiBSZBB3
 +Ppe4SRryjxFTVEVriYfZr3l4uBuA8+wWJyoKGdnzVj7yecQF+zhGAgcXCT75zjbqiLD
 huq4Ks2VgCkYfGNSE7UdypWrOWA4u64cY/WWey4i0+pV/6sZNvVWgBePc219y3tDVJjH
 FK+pReJiERPnCII2kmEHjduMjPtSZFy/pqxMHnSdcpPvrlfYS2HU3LUTZ3Py365UFOjg
 b6rOqvoG8fKx5AgjvEn2clURijDQR25p714a1wtSnTVm5NEOfondwxoMMOdF+3xgBOMZ
 8Ccw==
X-Gm-Message-State: AOAM530UVyVxyQqIalpkJi1EvrEfV17CiG4YrACD3BJxXfxKYbiNBw9V
 jzsDZuGvyx/dySUAYRelWUtxoU0+2oFu0lxPC+pyfg==
X-Google-Smtp-Source: ABdhPJyFSmuR7M4HIJ31YSJoOUpobAKTBK69kzVotLKdLdB2NRipgBTZ2XLKWECEqSNiqnwAnFetqc4Ion8CCMp0OGY=
X-Received: by 2002:a81:ad46:: with SMTP id l6mr3668263ywk.31.1644307779769;
 Tue, 08 Feb 2022 00:09:39 -0800 (PST)
MIME-Version: 1.0
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-5-hch@lst.de>
In-Reply-To: <20220207063249.1833066-5-hch@lst.de>
From: Muchun Song <songmuchun@bytedance.com>
Date: Tue, 8 Feb 2022 16:09:03 +0800
Message-ID: <CAMZfGtUqbU9VpCOA-9bdU6d1CoQ7n8D+26v4j79uLcH1uc5Q2w@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 10 Feb 2022 01:00:19 +0000
Subject: Re: [Nouveau] [PATCH 4/8] mm: move free_devmap_managed_page to
 memremap.c
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
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>, Dan Williams <dan.j.williams@intel.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Feb 7, 2022 at 2:42 PM Christoph Hellwig <hch@lst.de> wrote:
>
> free_devmap_managed_page has nothing to do with the code in swap.c,
> move it to live with the rest of the code for devmap handling.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

Thanks.
