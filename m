Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CE182EE55
	for <lists+nouveau@lfdr.de>; Tue, 16 Jan 2024 12:49:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A181A10E4E2;
	Tue, 16 Jan 2024 11:47:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B9B10E336
 for <nouveau@lists.freedesktop.org>; Wed, 29 Nov 2023 06:09:08 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5cef61289fdso63994047b3.1
 for <nouveau@lists.freedesktop.org>; Tue, 28 Nov 2023 22:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1701238147; x=1701842947;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=KtrAPaslMvSrZFznq3cpY4nyS514mOCdxUhLK1bsTtI=;
 b=fZFuFMGTHHI+2S3GkZRdB7djsxMSSARAGmJ4f/x5HADSOOrfnNL6N67bmgpQhWFZCA
 swq+Zx1zYMIlhQEa3OwqT2mSbUPzuNxSZkdPIVKqA2PJ86jV3YHRvWa7zyJoiwXXzZAM
 NVUU6A0aN1DogD2azFxUv4vTS0IKnCfvMy0aYIDvtTYpjHwOBJlrOu0/e/1EYr7rp11L
 cbsACTMlIWEBzxIPuji9npGm1ASUS2YnU0b8YnP7eicCBRdJyj4NcsBZWhhKqJ0fh40r
 J4FzYbQm5LOu+ilUCYP2JJefo364zrPFsB7vuZ4SrMaZbtO7qo2D3afM1Jav2w1B6J2P
 su3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701238147; x=1701842947;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KtrAPaslMvSrZFznq3cpY4nyS514mOCdxUhLK1bsTtI=;
 b=cfp7GVx0cyGzymxxFhq02acslWCO82m3U1G3iEXH3+WAcwcznHTMiLSiwqxFhWi6Q5
 1fhL6OvQMa5uvqcpP/xmzWuYea3kf+X/siDs6IdAT4NTIXXqMG1CIZ2h7xlFFTHdXQMZ
 ciir+H8BZM86YjUMYAoVforpFN4IJeWlhE+uJm3pRQcvoRxFrl2SNpfTJsYf+LPbDNhm
 sG0xaKUx+aMe5BtHcc5uKT1oe0tC2aybmh6yxWPkk2qm8Eurs6V7GXI34Jr3C9Qoo3uQ
 IR0TVEuynid7Mh5YmaoLja51DhwEUV66+LNHYr18a7s+h4LHWbhtpUiHO50dgmnvjHWt
 n5eA==
X-Gm-Message-State: AOJu0YzXJM0SaN/JYIyLn1BA4j4HtoK1o5rbgcSinDOzDClhlDDJdvM1
 +PmxaoweiMlcosihiql7QkJ/iBqJskXd
X-Google-Smtp-Source: AGHT+IErKpR33sSuZDb458AGzbTTTl+rmkeUZNxvoUYyius6/ySrcsirHg/Fcs0NR9CFHutX0EyL3PHfE3h2
X-Received: from morats.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:d9e])
 (user=moritzf job=sendgmr) by 2002:a25:3741:0:b0:db5:2a4:aef1 with
 SMTP id
 e62-20020a253741000000b00db502a4aef1mr107973yba.13.1701238147290; Tue, 28 Nov
 2023 22:09:07 -0800 (PST)
Date: Wed, 29 Nov 2023 06:09:06 +0000
In-Reply-To: <7-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
Mime-Version: 1.0
References: <0-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
 <7-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
Message-ID: <20231129060906.qti7uztsk2u7ehlp@google.com>
Subject: Re: [PATCH 07/10] acpi: Do not return struct iommu_ops from
 acpi_iommu_configure_id()
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

On Tue, Nov 28, 2023 at 08:48:03PM -0400, Jason Gunthorpe wrote:
> Nothing needs this pointer. Return a normal error code with the usual
> IOMMU semantic that ENODEV means 'there is no IOMMU driver'.

> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
> Tested-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/acpi/scan.c | 29 +++++++++++++++++------------
>   1 file changed, 17 insertions(+), 12 deletions(-)

> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 444a0b3c72f2d8..340ba720c72129 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -1562,8 +1562,7 @@ static inline const struct iommu_ops  
> *acpi_iommu_fwspec_ops(struct device *dev)
>   	return fwspec ? fwspec->ops : NULL;
>   }

> -static const struct iommu_ops *acpi_iommu_configure_id(struct device  
> *dev,
> -						       const u32 *id_in)
> +static int acpi_iommu_configure_id(struct device *dev, const u32 *id_in)
>   {
>   	int err;
>   	const struct iommu_ops *ops;
> @@ -1577,7 +1576,7 @@ static const struct iommu_ops  
> *acpi_iommu_configure_id(struct device *dev,
>   	ops = acpi_iommu_fwspec_ops(dev);
>   	if (ops) {
>   		mutex_unlock(&iommu_probe_device_lock);
> -		return ops;
> +		return 0;
>   	}

>   	err = iort_iommu_configure_id(dev, id_in);
> @@ -1594,12 +1593,14 @@ static const struct iommu_ops  
> *acpi_iommu_configure_id(struct device *dev,

>   	/* Ignore all other errors apart from EPROBE_DEFER */
>   	if (err == -EPROBE_DEFER) {
> -		return ERR_PTR(err);
> +		return err;
>   	} else if (err) {
>   		dev_dbg(dev, "Adding to IOMMU failed: %d\n", err);
> -		return NULL;
> +		return -ENODEV;
>   	}
> -	return acpi_iommu_fwspec_ops(dev);
> +	if (!acpi_iommu_fwspec_ops(dev))
> +		return -ENODEV;
> +	return 0;
>   }

>   #else /* !CONFIG_IOMMU_API */
> @@ -1611,10 +1612,9 @@ int acpi_iommu_fwspec_init(struct device *dev, u32  
> id,
>   	return -ENODEV;
>   }

> -static const struct iommu_ops *acpi_iommu_configure_id(struct device  
> *dev,
> -						       const u32 *id_in)
> +static int acpi_iommu_configure_id(struct device *dev, const u32 *id_in)
>   {
> -	return NULL;
> +	return -ENODEV;
>   }

>   #endif /* !CONFIG_IOMMU_API */
> @@ -1628,7 +1628,7 @@ static const struct iommu_ops  
> *acpi_iommu_configure_id(struct device *dev,
>   int acpi_dma_configure_id(struct device *dev, enum dev_dma_attr attr,
>   			  const u32 *input_id)
>   {
> -	const struct iommu_ops *iommu;
> +	int ret;

>   	if (attr == DEV_DMA_NOT_SUPPORTED) {
>   		set_dma_ops(dev, &dma_dummy_ops);
> @@ -1637,10 +1637,15 @@ int acpi_dma_configure_id(struct device *dev,  
> enum dev_dma_attr attr,

>   	acpi_arch_dma_setup(dev);

> -	iommu = acpi_iommu_configure_id(dev, input_id);
> -	if (PTR_ERR(iommu) == -EPROBE_DEFER)
> +	ret = acpi_iommu_configure_id(dev, input_id);
> +	if (ret == -EPROBE_DEFER)
>   		return -EPROBE_DEFER;

> +	/*
> +	 * Historically this routine doesn't fail driver probing due to errors
> +	 * in acpi_iommu_configure_id()
> +	 */
> +
>   	arch_setup_dma_ops(dev, 0, U64_MAX, attr == DEV_DMA_COHERENT);

>   	return 0;
> --
> 2.42.0


Reviewed-by: Moritz Fischer <moritzf@google.com>

Cheers,
Moritz
