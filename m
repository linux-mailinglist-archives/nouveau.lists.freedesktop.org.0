Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5692496DA37
	for <lists+nouveau@lfdr.de>; Thu,  5 Sep 2024 15:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0350610E8AA;
	Thu,  5 Sep 2024 13:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="BMqmq2b8";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD6610E8AA
 for <nouveau@lists.freedesktop.org>; Thu,  5 Sep 2024 13:25:01 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-6c35b72f943so6729696d6.0
 for <nouveau@lists.freedesktop.org>; Thu, 05 Sep 2024 06:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1725542701; x=1726147501; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QQZ/prAHSJzNYvQ41aDnul/jxJL4VTE2Yg49JItkgwg=;
 b=BMqmq2b8sdtq9wzbjPAcb3GldvCKqNCA9P4F/1MZDba4sfXTWNYvFkWa0f+JhIKDNk
 3QfG4S05jp2g81TR+mCB1we/pE2jCk8uQ+2iFqJhXsy8fBWCitlttQhQG8u3UIV8Aq6P
 9SAVPmPGmpf1I9eSVC6gkOxIplNGl6eT6FemQzSuiM+Td0TBpVjqdLbAY/m/5QnAH9a2
 fMng89+pYtMRL28uLUM38GaCBa4wi58gzZAmLy9Zy5G1Im0vFLjO6Y56N5fPN7sE/5k/
 xi/tCwx97zRG7KgTs/gSYJcsdmsCNNOrv4hLa+Sp2EB/9g8Yr2aUJHW8g1bVWX88rL6R
 K87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725542701; x=1726147501;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QQZ/prAHSJzNYvQ41aDnul/jxJL4VTE2Yg49JItkgwg=;
 b=BhMalsR3S0RH43H7sm82RWEUeU0b7edX1oZ2kNmCNCYLw6M3lpRro5WWJn7qBdwwum
 FN9qseoFjml15T0Wc5ZQ+jDnVkd9HIkiCXL2BXR5J1fORaBhcPu03zgDiMfiz7fzZPLz
 6UgFSVi4wIoIxTAwv0tvb7dHzIQlOP/NnLaE5zUQIWhi29JpOVl3C7ju4hThz05r1+pS
 yPYc9gL1z8l3O74vrrBXsNfStaHwR0GeSvaAjfgIjGSKcsNNUx1HnwaIN+Cfwm18Skna
 ezTcLkf9YxyKH3ELbqireMlJ2xbhu1oPNusiRaGo4tcE3+DYnen1z1MInYmT3x/+29OL
 bx4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQ8sJhDduEJZAm/Y6wCZUwYUIPXs6C4ddbt9WDyZ5Mf/zPd0U5S2TQOqf3N6IOah4fLxROR9UK@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvA+IZkJiAJnb1icYwQuFcfX6QH2qyaEdMaH3vfBVq84qTlF21
 UaoCP38h1LzCLpDuj5jH6AJzLollrKL23UmT1m2I3RO2XLqBTvxnMfZrfPKdnXk=
X-Google-Smtp-Source: AGHT+IEDu6pY51+TBXvcoJ6tFwe8exqs/WY3csyGmyVmQ8kYoFXlzHQS0zH+YsMUz1IR39QgtqrhaA==
X-Received: by 2002:ad4:44a8:0:b0:6c3:6799:dde3 with SMTP id
 6a1803df08f44-6c5191197b4mr91124026d6.23.1725542700794; 
 Thu, 05 Sep 2024 06:25:00 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c5201dff49sm7525176d6.15.2024.09.05.06.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 06:25:00 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1smCTr-00CTrV-Rv;
 Thu, 05 Sep 2024 10:24:59 -0300
Date: Thu, 5 Sep 2024 10:24:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Lu Baolu <baolu.lu@linux.intel.com>, Karol Herbst <kherbst@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sandy Huang <hjc@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Kevin Tian <kevin.tian@intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] drm/nouveau/tegra: Use iommu_paging_domain_alloc()
Message-ID: <20240905132459.GG1909087@ziepe.ca>
References: <20240902014700.66095-1-baolu.lu@linux.intel.com>
 <20240902014700.66095-2-baolu.lu@linux.intel.com>
 <a43c31da6a6989874eb0998dc937d7a611ec542c.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a43c31da6a6989874eb0998dc937d7a611ec542c.camel@redhat.com>
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

On Wed, Sep 04, 2024 at 03:06:07PM -0400, Lyude Paul wrote:
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> 
> Will handle pushing it to drm-misc in just a moment

Did you just take this one patch? 

Who will take the rest of the series for DRM?

Jason
