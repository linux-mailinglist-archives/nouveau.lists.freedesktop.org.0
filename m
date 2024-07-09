Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3952992BD5E
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 16:48:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A708010E229;
	Tue,  9 Jul 2024 14:48:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="N6JMv49C";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14BA510E229
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 14:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720536491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Su6hv/BSRNrdGoWAnf2H5/9SDIxKph76x5PEpvYcSNY=;
 b=N6JMv49Cbn03sFLd9gH18uYgOeUmPcCwbb5Iu9bn/URIaVLTgA5wJi9x0Zkx3dvslChAni
 tn1KSTwJv17MDWkh8Fg4Wd92n7pryY7gu6LzVdLPiucOaMHRL/z8YEx7NPr2OudIRLR3BT
 DRE4XitTNXNymyd3eFsB0/Twq1mudEw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-7zgMaigCPgi-pVN1YN4zOw-1; Tue, 09 Jul 2024 10:48:08 -0400
X-MC-Unique: 7zgMaigCPgi-pVN1YN4zOw-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3679ab94cdbso3765287f8f.3
 for <nouveau@lists.freedesktop.org>; Tue, 09 Jul 2024 07:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720536487; x=1721141287;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Su6hv/BSRNrdGoWAnf2H5/9SDIxKph76x5PEpvYcSNY=;
 b=HjGoyOBOqtV+71WaWj/YhzKklpSf6GLep3d7b/XUhwST/q0Mu+syOfgZ10q1ujT90c
 uMBOTJI628jkBKjyrCWRLpZGnnDs+C7AIDiM820myEH3WfzXU1Rowez4iw1fdMxNlneT
 LaPjidUOrcZNycedhir3ml5c4VvjY+/aF368pkYriMq6IFgTmIs9GsDB3L3yOdD7ftVY
 hDoEInNaQKWzOHAPmaJ7J2jV+ChLg8xinXbPrUkj1KMYVXUHu4+FAx98d9mqapN4KkpJ
 O2Hjm/w7Jsn5b5RVt6BiEZtevsc3V4vmgnuGdbwbuLcrqRSHNKk1EKYsv5xqWt4PAViE
 P6nA==
X-Gm-Message-State: AOJu0YylWJgQO9X6SjqpUB99ss+A99VoSki6cyIViq+XbY5DxqbSngPu
 7ZD0DC+IKo9XoDjUOJ5W072iwwlr6wenYSLKtYS+jbq/zBv7MffcRyZbxVDDxIFAGQKVQ6esZ0p
 OR+nBo5KoU6zyF7bh1mJI7vsJ28Qcjju4Tk8Syr6/OC+vvN3dJznA9RnzvRdqaoyxG4j8/DY=
X-Received: by 2002:a5d:64c6:0:b0:367:a4c7:a134 with SMTP id
 ffacd0b85a97d-367cea96239mr2703297f8f.40.1720536487256; 
 Tue, 09 Jul 2024 07:48:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4hUO1nlb0wZk6NfKDI1zD2Fm3g+TKwKLCAit+Yb0zViUm26aZe2y4didbZlZwFvjzfR9FTQ==
X-Received: by 2002:a5d:64c6:0:b0:367:a4c7:a134 with SMTP id
 ffacd0b85a97d-367cea96239mr2703275f8f.40.1720536486888; 
 Tue, 09 Jul 2024 07:48:06 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfab11csm2743215f8f.102.2024.07.09.07.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 07:48:06 -0700 (PDT)
Date: Tue, 9 Jul 2024 16:48:04 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 01/37] drm/nouveau: move nouveau_drm_device_fini()
 above init()
Message-ID: <Zo1NpGOo_O3uwVMU@pollux>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
 <20240704183721.25778-2-bskeggs@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240704183721.25778-2-bskeggs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

On Fri, Jul 05, 2024 at 04:36:45AM +1000, Ben Skeggs wrote:
> The next commit wants to be able to call fini() from an init() failure
> path to remove the need to duplicate a bunch of cleanup.
> 
> Moving fini() above init() avoids the need for a forward-declaration.

Hm, I don't really like that this makes git-blame less useful for this function,
moving it up is clearly cleaner though - your call.

> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 106 +++++++++++++-------------
>  1 file changed, 53 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index a58c31089613..eae48c87e3d5 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -578,6 +578,59 @@ nouveau_parent = {
>  	.errorf = nouveau_drm_errorf,
>  };
>  
> +static void
> +nouveau_drm_device_fini(struct drm_device *dev)
> +{
> +	struct nouveau_cli *cli, *temp_cli;
> +	struct nouveau_drm *drm = nouveau_drm(dev);
> +
> +	if (nouveau_pmops_runtime()) {
> +		pm_runtime_get_sync(dev->dev);
> +		pm_runtime_forbid(dev->dev);
> +	}
> +
> +	nouveau_led_fini(dev);
> +	nouveau_dmem_fini(drm);
> +	nouveau_svm_fini(drm);
> +	nouveau_hwmon_fini(dev);
> +	nouveau_debugfs_fini(drm);
> +
> +	if (dev->mode_config.num_crtc)
> +		nouveau_display_fini(dev, false, false);
> +	nouveau_display_destroy(dev);
> +
> +	nouveau_accel_fini(drm);
> +	nouveau_bios_takedown(dev);
> +
> +	nouveau_ttm_fini(drm);
> +	nouveau_vga_fini(drm);
> +
> +	/*
> +	 * There may be existing clients from as-yet unclosed files. For now,
> +	 * clean them up here rather than deferring until the file is closed,
> +	 * but this likely not correct if we want to support hot-unplugging
> +	 * properly.
> +	 */
> +	mutex_lock(&drm->clients_lock);
> +	list_for_each_entry_safe(cli, temp_cli, &drm->clients, head) {
> +		list_del(&cli->head);
> +		mutex_lock(&cli->mutex);
> +		if (cli->abi16)
> +			nouveau_abi16_fini(cli->abi16);
> +		mutex_unlock(&cli->mutex);
> +		nouveau_cli_fini(cli);
> +		kfree(cli);
> +	}
> +	mutex_unlock(&drm->clients_lock);
> +
> +	nouveau_cli_fini(&drm->client);
> +	nouveau_cli_fini(&drm->master);
> +	destroy_workqueue(drm->sched_wq);
> +	nvif_parent_dtor(&drm->parent);
> +	mutex_destroy(&drm->clients_lock);
> +	kfree(drm);
> +}
> +
>  static int
>  nouveau_drm_device_init(struct drm_device *dev)
>  {
> @@ -679,59 +732,6 @@ nouveau_drm_device_init(struct drm_device *dev)
>  	return ret;
>  }
>  
> -static void
> -nouveau_drm_device_fini(struct drm_device *dev)
> -{
> -	struct nouveau_cli *cli, *temp_cli;
> -	struct nouveau_drm *drm = nouveau_drm(dev);
> -
> -	if (nouveau_pmops_runtime()) {
> -		pm_runtime_get_sync(dev->dev);
> -		pm_runtime_forbid(dev->dev);
> -	}
> -
> -	nouveau_led_fini(dev);
> -	nouveau_dmem_fini(drm);
> -	nouveau_svm_fini(drm);
> -	nouveau_hwmon_fini(dev);
> -	nouveau_debugfs_fini(drm);
> -
> -	if (dev->mode_config.num_crtc)
> -		nouveau_display_fini(dev, false, false);
> -	nouveau_display_destroy(dev);
> -
> -	nouveau_accel_fini(drm);
> -	nouveau_bios_takedown(dev);
> -
> -	nouveau_ttm_fini(drm);
> -	nouveau_vga_fini(drm);
> -
> -	/*
> -	 * There may be existing clients from as-yet unclosed files. For now,
> -	 * clean them up here rather than deferring until the file is closed,
> -	 * but this likely not correct if we want to support hot-unplugging
> -	 * properly.
> -	 */
> -	mutex_lock(&drm->clients_lock);
> -	list_for_each_entry_safe(cli, temp_cli, &drm->clients, head) {
> -		list_del(&cli->head);
> -		mutex_lock(&cli->mutex);
> -		if (cli->abi16)
> -			nouveau_abi16_fini(cli->abi16);
> -		mutex_unlock(&cli->mutex);
> -		nouveau_cli_fini(cli);
> -		kfree(cli);
> -	}
> -	mutex_unlock(&drm->clients_lock);
> -
> -	nouveau_cli_fini(&drm->client);
> -	nouveau_cli_fini(&drm->master);
> -	destroy_workqueue(drm->sched_wq);
> -	nvif_parent_dtor(&drm->parent);
> -	mutex_destroy(&drm->clients_lock);
> -	kfree(drm);
> -}
> -
>  /*
>   * On some Intel PCIe bridge controllers doing a
>   * D0 -> D3hot -> D3cold -> D0 sequence causes Nvidia GPUs to not reappear.
> -- 
> 2.45.1
> 

