Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEF451E0D0
	for <lists+nouveau@lfdr.de>; Fri,  6 May 2022 23:09:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69D910E02E;
	Fri,  6 May 2022 21:09:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1309610E02E
 for <nouveau@lists.freedesktop.org>; Fri,  6 May 2022 21:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651871391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UC8PN3IHksXw4YLUl2DR5j2jd0ER+gWoSOxwPmBpqKg=;
 b=FWoRerSRmffaC1A6NDwhnwcJH3uWoiz+ydt/AUD6a2rTBsK0D5T4eE/V7auFlqyLXLa9ES
 2rFe/aB7r/G6UE96JYFNwFlLQiDZEnZayGS2JnTlE0OdBYo1tEtqDXcTPDIhjMIItAt3Iz
 1lfH2gdY4UwpocWTE2xXDT0WfAFsTJE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-4JCcKaF7NFODHC_Ae6JMIQ-1; Fri, 06 May 2022 17:09:50 -0400
X-MC-Unique: 4JCcKaF7NFODHC_Ae6JMIQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 w21-20020a05622a135500b002f3b801f51eso7004496qtk.23
 for <nouveau@lists.freedesktop.org>; Fri, 06 May 2022 14:09:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=UC8PN3IHksXw4YLUl2DR5j2jd0ER+gWoSOxwPmBpqKg=;
 b=S7yvoW2piEZuV6xr6VMirNXg5s9JPQQlDVvjc5A1Td/LH3gw5m7VQ6WBkFD7vExs7S
 l6gYKcadt3P6KRnyot6K/Ivdo7eXd78BbbJGNnEF2V9body8y4NeoXX9WghJ8ImCBckr
 zHPBgtFr9qwps7vvY151qEtsJezqBEx3XklMdY7bejssyburhg/jdebfp0Uh/Ehj8Fq2
 q2ofajmnYfzpvzKtzG9Udf5k/oC+BBjpVOaeFfEVcP2VY80S31+VpqNfwohgTJa9fR2V
 CWVA2d2ed0YXimcboZ4tA7dfrnZEfxMjkQMe2jGdVDnj/vxgPtzcK89xgca7EWVTonyW
 lMSw==
X-Gm-Message-State: AOAM532isaFgiOPmYwiWjCNAzfxhqMDYSA5zjVwYMzxoFNLMlixu2Ky2
 tr/oH6JhZ0/nQYQBVKnwsMXmT8SwKYRf1VgTCmtxjghiYb2HHF/bDJ6fZmF/kUL4n77xQwZ50HM
 5/aE+aL7iLBhs/fgAN5tQ/x6Leg==
X-Received: by 2002:ac8:57d2:0:b0:2f3:b3b0:ecbe with SMTP id
 w18-20020ac857d2000000b002f3b3b0ecbemr4766070qta.29.1651871389886; 
 Fri, 06 May 2022 14:09:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXZnGn2kgpYuxbTXggVBq/gakbuX/nYQzG8wHJicm20zlfTeeC+kYw7imlv4ImNqRIYEC4Og==
X-Received: by 2002:ac8:57d2:0:b0:2f3:b3b0:ecbe with SMTP id
 w18-20020ac857d2000000b002f3b3b0ecbemr4766041qta.29.1651871389605; 
 Fri, 06 May 2022 14:09:49 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 de27-20020a05620a371b00b0069fe1fc72e7sm3030497qkb.90.2022.05.06.14.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 14:09:49 -0700 (PDT)
Message-ID: <8ec2715e36dbd1fab8a31b4b12660ae83e29303d.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Robin Murphy <robin.murphy@arm.com>, bskeggs@redhat.com, kherbst@redhat.com
Date: Fri, 06 May 2022 17:09:47 -0400
In-Reply-To: <70d40ea441da3663c2824d54102b471e9a621f8a.1649168494.git.robin.murphy@arm.com>
References: <70d40ea441da3663c2824d54102b471e9a621f8a.1649168494.git.robin.murphy@arm.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH] drm/nouveau/tegra: Stop using iommu_present()
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux-foundation.org, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Whoops! Was going through my unread emails and noticed I somehow missed this
patch last month.

Reviewed-by: Lyude Paul <lyude@redhat.com>

I will push this to drm-misc-fixes in a little bit (assuming I don't find it
there already)

On Tue, 2022-04-05 at 15:21 +0100, Robin Murphy wrote:
> Even if some IOMMU has registered itself on the platform "bus", that
> doesn't necessarily mean it provides translation for the device we
> care about. Replace iommu_present() with a more appropriate check.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> index 992cc285f2fe..2ed528c065fa 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> @@ -123,7 +123,7 @@ nvkm_device_tegra_probe_iommu(struct nvkm_device_tegra
> *tdev)
>  
>         mutex_init(&tdev->iommu.mutex);
>  
> -       if (iommu_present(&platform_bus_type)) {
> +       if (device_iommu_mapped(dev)) {
>                 tdev->iommu.domain = iommu_domain_alloc(&platform_bus_type);
>                 if (!tdev->iommu.domain)
>                         goto error;

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

