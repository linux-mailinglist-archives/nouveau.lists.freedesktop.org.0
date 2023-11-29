Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1810882EE73
	for <lists+nouveau@lfdr.de>; Tue, 16 Jan 2024 12:51:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D3E10E4A2;
	Tue, 16 Jan 2024 11:48:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A761010E5FE
 for <nouveau@lists.freedesktop.org>; Wed, 29 Nov 2023 06:06:05 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5cd6a86a898so78490537b3.3
 for <nouveau@lists.freedesktop.org>; Tue, 28 Nov 2023 22:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1701237965; x=1701842765;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=BFBgGZHgdrEFpnu/cpKOcJzser1reIBdXzg/6fniV64=;
 b=xqCTSCGBzzpc0xThThjFhaptQiRs3bpBmpk33zAXn2Ys2pa8qLrCdoZnvIYn/MMM5B
 2sdrcC2iw7oYKrHzjQ/b9q7tk3UO+/u9nsY/WwB0oCayc1TkXeHXuE9uX/DizTZRxSJ5
 7nHdLDszTvXj3xcaD63AzGKCUjAvL1UqZkEe7yfIeRGA92pXoQsHunIJgTbIhqFHzD2K
 zTJh5NOqElMbVFNlUx7/SNHMULMgZrnpGYfE/W0IvUImQRtAHM7FPxV7hvBi0XtKq0ol
 itzbFUp76n1ZqO0GA0/t1q5Hrgh4rNqYhnpFtBNjKC5rGX5oCRVfuKz5dvvI5AvDHxsa
 venA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701237965; x=1701842765;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BFBgGZHgdrEFpnu/cpKOcJzser1reIBdXzg/6fniV64=;
 b=q9B/Fkky0aaCDG4T9PW/Jg837oIkHXk6Keh7FOkzWDpgHF+5tkGCqjWqo9HzE3m0TW
 G4yqm2egdo2EJLw0xYUCVpOLNgswtnf361id3OiVDItpvPLqA6GnAzsHEFB0FS3zJzz4
 oFZLwoX15Sx11RKCZxupc9TtZzH8d18G9BDIMqZJ/1OGBFfg9sAWfRItEOb+7EzkfOAK
 dJPV9uqelBSNuHRUKDo+RR9zhN45duhDkzqfX4xzBtprpaAiqoEUhrRKoe/auIpO3LgK
 XOjcV/BL2n7j+cXyYHVkiFFeYx0aatsIAFggPuyPDLGP3QVq97vm4xQAPkxrynUg3REA
 ihtw==
X-Gm-Message-State: AOJu0Ywct+PqMNFnew1pYo6Ri7xm0SSI+LK3oOzLXUYFm+Z1FcHVHTKJ
 mHcjWR5LkYUII0a0H+o003qaCCKUX40v
X-Google-Smtp-Source: AGHT+IG4ZcbE3hB8V6+vKX0zxYUr0OpHfbf/WNlvcGBdlOoo8eTYBCxtpp+7m/8KdVPZTHDTWhORx94znMfW
X-Received: from morats.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:d9e])
 (user=moritzf job=sendgmr) by 2002:a25:c044:0:b0:db5:1f69:704e
 with SMTP id
 c65-20020a25c044000000b00db51f69704emr38263ybf.1.1701237964651; Tue, 28 Nov
 2023 22:06:04 -0800 (PST)
Date: Wed, 29 Nov 2023 06:06:03 +0000
In-Reply-To: <4-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
Mime-Version: 1.0
References: <0-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
 <4-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
Message-ID: <20231129060603.hxtmbsefxurxnwkh@google.com>
Subject: Re: [PATCH 04/10] iommu: Mark dev_iommu_get() with lockdep
From: Moritz Fischer <moritzf@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-Mailman-Approved-At: Tue, 16 Jan 2024 11:47:29 +0000
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
Cc: linux-hyperv@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Jerry Snitselaar <jsnitsel@redhat.com>, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, Laxman Dewangan <ldewangan@nvidia.com>,
 Hanjun Guo <guohanjun@huawei.com>, linux-riscv@lists.infradead.org,
 "K. Y. Srinivasan" <kys@microsoft.com>, Frank Rowand <frowand.list@gmail.com>,
 Christoph Hellwig <hch@lst.de>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Rob Herring <robh@kernel.org>,
 Wei Liu <wei.liu@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Dexuan Cui <decui@microsoft.com>, Russell King <linux@armlinux.org.uk>,
 linux-acpi@vger.kernel.org, iommu@lists.linux.dev,
 nouveau@lists.freedesktop.org, linux-snps-arc@lists.infradead.org,
 Len Brown <lenb@kernel.org>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Will Deacon <will@kernel.org>, Sven Peter <sven@svenpeter.dev>,
 Haiyang Zhang <haiyangz@microsoft.com>, Vineet Gupta <vgupta@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Robin Murphy <robin.murphy@arm.com>, Hector Martin <marcan@marcan.st>,
 linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 asahi@lists.linux.dev, Daniel Vetter <daniel@ffwll.ch>,
 Sudeep Holla <sudeep.holla@arm.com>, dmaengine@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Nov 28, 2023 at 08:48:00PM -0400, Jason Gunthorpe wrote:
> Allocation of dev->iommu must be done under the
> iommu_probe_device_lock. Mark this with lockdep to discourage future
> mistakes.

> Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
> Tested-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/iommu.c | 2 ++
>   1 file changed, 2 insertions(+)

> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 0d25468d53a68a..4323b6276e977f 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -334,6 +334,8 @@ static struct dev_iommu *dev_iommu_get(struct device  
> *dev)
>   {
>   	struct dev_iommu *param = dev->iommu;

> +	lockdep_assert_held(&iommu_probe_device_lock);
> +
>   	if (param)
>   		return param;

> --
> 2.42.0


Reviewed-by: Moritz Fischer <moritzf@google.com>

Cheers,
Moritz
