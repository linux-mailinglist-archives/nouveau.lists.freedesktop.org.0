Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F28529796F7
	for <lists+nouveau@lfdr.de>; Sun, 15 Sep 2024 16:08:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A889110E122;
	Sun, 15 Sep 2024 14:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="PfmD8Jhn";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8058810E107
 for <nouveau@lists.freedesktop.org>; Sun, 15 Sep 2024 14:08:08 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-6c582ca168fso14482836d6.2
 for <nouveau@lists.freedesktop.org>; Sun, 15 Sep 2024 07:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1726409287; x=1727014087; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qETOmqLs3VcWBE6fq/NLpP/VdMfGfLvWYa4naTceEbU=;
 b=PfmD8JhnNrHD7XBTZFgwo5/pPmTXuJaw6sqI9oFaHlWshzi/YnRH9InOwDRnhMWQOR
 UbV7ERUkt/9UMfgsfReO8TDm1r91CgTgpdFaFcsTGcrmBI/eJBn4/L4NV+WvmGFNhsn0
 9AA/Ns1V+czgwg4oXrIveLJqH0wX8hQK5lBhN914gyVB2Z6WF5JU08ReSlYOYSgzF0yX
 Oz/8SIGzUWYVnEaAWv3B8QOB5QnKRIibeKNGRTbn4mLiFv/xMTyK3AMm7aNnwzoLMguX
 ygo3FyBjdpiAf4EQakNBbcQRs8rsT4U9o2R27BzNS2qjuyjcilIK8xxOivAHSzDoKAPN
 5Jlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726409287; x=1727014087;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qETOmqLs3VcWBE6fq/NLpP/VdMfGfLvWYa4naTceEbU=;
 b=NEJSXVPslQ79az3DI+N16JTZBOOvMNcxJQkWmB6MIoyW+Fc+iMe+O2zXrLtOz0D+Ua
 93Dy433deO4XQolbui+5MjkArSuC/swcV8w5inXo4XXvF0Hv/GqIiracB3e68bEwqWIw
 z0bayLAThVJ16FKrNQnJUzJ2oNJMykIUpGa/iVuDNIC6xETzptWpoANdjqarvmfkbVO9
 atbOD7B/XsvTc7bAb8SHdPbY0Fxd2NwY2dVjUlqpIPm0/AyfC2AFKIo0UBuTsAd7EyOa
 kJX+yRsfjdBl9BvXtg/XBpdcFqbMiTkQznHKWD2gqPB6FdRm98yqx0Kau0C6lhSM7SN2
 ej/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIyFcKEcLXdd5VdJjySsXglQGtDwuwQ64MbQrrkxAKH+42eZupgQOrq+LEZxRXWD0jHURMdAcp@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2HgFwb+eug1/NU3whf8SczKrKXFwDnsnMwyH7CHj7zqDvO+Bc
 p9N37Nh0GWziaOlL7e9qktGe1/V9sUi7Omx7zM3bQxGJaueBAmmhsKXDJ2fRoXU=
X-Google-Smtp-Source: AGHT+IEGScRXWkjCa1MsukJtaEHzEo9sxiP6ZOXcwDMa/t01rqjqte/GHdDfO4BuPAC0Ip8flPeYYw==
X-Received: by 2002:a05:6214:5a07:b0:6c5:5326:18a5 with SMTP id
 6a1803df08f44-6c57dfb94a0mr155649476d6.28.1726409287152; 
 Sun, 15 Sep 2024 07:08:07 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c58c632f7bsm16033696d6.37.2024.09.15.07.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 07:08:06 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sppv4-007h2G-0a;
 Sun, 15 Sep 2024 11:08:06 -0300
Date: Sun, 15 Sep 2024 11:08:06 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Lyude Paul <lyude@redhat.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lu Baolu <baolu.lu@linux.intel.com>, Karol Herbst <kherbst@redhat.com>,
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
Message-ID: <20240915140806.GE869260@ziepe.ca>
References: <20240902014700.66095-1-baolu.lu@linux.intel.com>
 <20240902014700.66095-2-baolu.lu@linux.intel.com>
 <a43c31da6a6989874eb0998dc937d7a611ec542c.camel@redhat.com>
 <20240905132459.GG1909087@ziepe.ca>
 <243808ad949823a0d64cd785ed05a375ccdba096.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <243808ad949823a0d64cd785ed05a375ccdba096.camel@redhat.com>
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

On Thu, Sep 05, 2024 at 12:26:31PM -0400, Lyude Paul wrote:
> I did take the one patch - but I'm happy to push the others to drm-misc
> (provided they all get reviewed. 2/3 seems to be reviewed already but not 3/3)

Did it get lost?

$ git reset --hard next-20240913
$ git grep 'iommu_domain_alloc(' drivers/gpu/
drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c:		tdev->iommu.domain = iommu_domain_alloc(&platform_bus_type);

??

 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c |  4 ++--
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        | 10 +++++++---
 drivers/gpu/drm/tegra/drm.c                        |  5 +++--

Now we have the other two but not nouveau?

Jason
