Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A66D399DD04
	for <lists+nouveau@lfdr.de>; Tue, 15 Oct 2024 05:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206FC10E158;
	Tue, 15 Oct 2024 03:49:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="Ff8ZAKBM";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB6D10E158
 for <nouveau@lists.freedesktop.org>; Tue, 15 Oct 2024 03:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=WMrPAuZiquJTe8IjR47E8lscXQVdMQ4TT6Vykiu/a5o=; b=Ff8ZAKBMgb+DzV+uiJJSofO4Y4
 nTnBFhkkaywo9jYDkgCsZ3PvHziBcT+G32vAYV7376CoiEY01HbjAB1hhhojC+PIs2hk7fAij0HZR
 PRzkSElZqjWV+28+8TQ9B/XS6cm5tF5lPZ3qSX8uTQuEEV0ASUtKO0X758fckIcXzUWDgeTJ+VR+N
 wY+rkYnK1MiNpaBovFO4Nji9n51ykpFbabpcJuSGcur572SOLo8IlEZZSqQcUlt3cVYEPQATY8a5j
 Q6jM5ZwDd6VKzIVeCNx3GJWPpUJBBKXbsk0thoS1W6gxOWTzTyzK4eP7aLHC8gWbrIh3CGsP0abiu
 dI3iguCg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1t0YZG-000000070jz-3KEd; Tue, 15 Oct 2024 03:49:54 +0000
Date: Mon, 14 Oct 2024 20:49:54 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Zhi Wang <zhiw@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 Andy Currid <ACurrid@nvidia.com>, Neo Jia <cjia@nvidia.com>,
 Surath Mitra <smitra@nvidia.com>, Ankit Agrawal <ankita@nvidia.com>,
 Aniket Agashe <aniketa@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>,
 "zhiwang@kernel.org" <zhiwang@kernel.org>
Subject: Re: [RFC 06/29] nvkm/vgpu: set RMSetSriovMode when NVIDIA vGPU is
 enabled
Message-ID: <Zw3mYtej2fAp4-Ei@infradead.org>
References: <20240922124951.1946072-1-zhiw@nvidia.com>
 <20240922124951.1946072-7-zhiw@nvidia.com>
 <20240926225343.GV9417@nvidia.com>
 <bc19bc8f-1692-49f5-9286-d4442714776e@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc19bc8f-1692-49f5-9286-d4442714776e@nvidia.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Oct 14, 2024 at 07:38:03AM +0000, Zhi Wang wrote:
> As what has been explained in PATCH 4's reply, the concept of vGPU and 
> VF are not identically equal. PCI SRIOV VF is the HW interface of 
> reaching a vGPU and there were generations in which HW didn't have SRIOV 
> VFs and a vGPU is reached via other means.

What does "were" mean.  Are they supported by this driver?  If so how.
If not that's entirely irrelevant.
