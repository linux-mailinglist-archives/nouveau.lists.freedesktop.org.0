Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E26A28FB087
	for <lists+nouveau@lfdr.de>; Tue,  4 Jun 2024 12:53:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6986D10E451;
	Tue,  4 Jun 2024 10:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UzrL2JvV";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF05210E452
 for <nouveau@lists.freedesktop.org>; Tue,  4 Jun 2024 10:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717498428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3n731lZEmsuMv2Jb/pe8kLZmFsTylP7q48pqpRihJU8=;
 b=UzrL2JvVgGUKp2GWIAaer4e2pzhE2oi6A0h4QWmD1/My7//reIJGqVFrvr47K+YyQ6zTX1
 wnmlTGUKUqI3iBb96/vGOOCMTGkR/ITjFfC8mnC5KFF3fmVU6dVITFVbidBSyeJ7aDEzXP
 nH5F6tgSLAQWSFaIZyPGuEHie+5/VvQ=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-533-zlXSvVUTNS6Pq4imD8cqVA-1; Tue, 04 Jun 2024 06:53:46 -0400
X-MC-Unique: zlXSvVUTNS6Pq4imD8cqVA-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2eaa77740deso7270811fa.0
 for <nouveau@lists.freedesktop.org>; Tue, 04 Jun 2024 03:53:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717498424; x=1718103224;
 h=content-transfer-encoding:in-reply-to:organization:from:cc
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3n731lZEmsuMv2Jb/pe8kLZmFsTylP7q48pqpRihJU8=;
 b=qFHXEiZexqfNswhkt/b+0Aw8hsMagBpG0LbNmRPfIpkI7aCgyD1gz0FSJK7dKYhTCv
 b2iISBJu2XXEDhJ0UOYEjzzHL17ApKktHmzdZdk0k6ozrjqKEMi+ngzor3cTVetebAkU
 9ZBHX+MFQM9MyfLVfPasoAaxGaWD2x/3WgWMKv7bhwRs7zaXE+ZlogJajUxPRgxf0uka
 7p/hBNHiyd5ZDLtyP39SrgP/DLO27h/+SG1xAT6iUxio5ZW+6Ql8jqMUAYk1VZPWptB6
 KvbXmwmBrRc/nHDu5nuk3gGL/aDVwWfVmiJjmI3zwesACr8q6Indu/YCfH96Y8tw/iQU
 quyQ==
X-Gm-Message-State: AOJu0Yzl2pY2q4DwPYabIKMk8D2dsY5NQmLF9xvEW3jrqpmMeyIiQqNO
 3lo/LwTLoRvYX+ZYZP612P9HvRW6DcT0QYLki/jscs+GkxWPkZH3MidHW4SrsUXCj3cFSb5M7mv
 Pt2aec216XgN1N8wDPsfZ/ksDLjPIkidCnH/6gkPahl2qpGD0+5+sDk0dWNMJU9GSMBhGhgQ=
X-Received: by 2002:a2e:8e7c:0:b0:2e9:841a:814d with SMTP id
 38308e7fff4ca-2ea950e9c37mr75207201fa.21.1717498424601; 
 Tue, 04 Jun 2024 03:53:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiSZtt2QlVhaVo+PNwX3Mb+L9B4iZAxIqPgR9l1xuI8DmZX+wjh7aLDz0J/Z08s6QjvkcZrQ==
X-Received: by 2002:a2e:8e7c:0:b0:2e9:841a:814d with SMTP id
 38308e7fff4ca-2ea950e9c37mr75207071fa.21.1717498424152; 
 Tue, 04 Jun 2024 03:53:44 -0700 (PDT)
Received: from [10.32.64.131] (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42138682bd7sm102109345e9.46.2024.06.04.03.53.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jun 2024 03:53:43 -0700 (PDT)
Message-ID: <440c7463-4611-411a-9270-d41712e5875a@redhat.com>
Date: Tue, 4 Jun 2024 12:53:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/34] drm/nouveau: move allocation of root client out of
 nouveau_cli_init()
To: Ben Skeggs <bskeggs@nvidia.com>
References: <20240527141959.59193-1-bskeggs@nvidia.com>
 <20240527141959.59193-4-bskeggs@nvidia.com>
Cc: nouveau@lists.freedesktop.org
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240527141959.59193-4-bskeggs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 5/27/24 16:19, Ben Skeggs wrote:
> drm->master isn't really a nouveau_cli, and is mostly just used to get
> at an nvif_mmu object to implement a hack around issues with the ioctl
> interface to nvkm.
> 
> Later patches in this series will allocate nvif_device/mmu objects in
> nouveau_drm directly, removing the need for master.
> 
> Another patch series will remove the need for the above-mentioned hack
> entirely.

How does this patch improve the situation for removing the master 
instance later on?

> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>   drivers/gpu/drm/nouveau/nouveau_drm.c | 23 +++++++++++++++--------
>   1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index e6ed68dcef78..25b9c3b19bc0 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -209,9 +209,11 @@ nouveau_cli_fini(struct nouveau_cli *cli)
>   	nouveau_vmm_fini(&cli->vmm);
>   	nvif_mmu_dtor(&cli->mmu);
>   	nvif_device_dtor(&cli->device);
> -	mutex_lock(&cli->drm->master.lock);
> -	nvif_client_dtor(&cli->base);
> -	mutex_unlock(&cli->drm->master.lock);
> +	if (cli != &cli->drm->master) {
> +		mutex_lock(&cli->drm->master.lock);
> +		nvif_client_dtor(&cli->base);
> +		mutex_unlock(&cli->drm->master.lock);
> +	}
>   }
>   
>   static int
> @@ -253,10 +255,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
>   	INIT_LIST_HEAD(&cli->worker);
>   	mutex_init(&cli->lock);
>   
> -	if (cli == &drm->master) {
> -		ret = nvif_driver_init(NULL, nouveau_config, nouveau_debug,
> -				       cli->name, device, &cli->base);
> -	} else {
> +	if (cli != &drm->master) {
>   		mutex_lock(&drm->master.lock);
>   		ret = nvif_client_ctor(&drm->master.base, cli->name, device,
>   				       &cli->base);
> @@ -593,11 +592,16 @@ nouveau_drm_device_init(struct drm_device *dev, struct nvkm_device *nvkm)
>   	nvif_parent_ctor(&nouveau_parent, &drm->parent);
>   	drm->master.base.object.parent = &drm->parent;
>   
> +	ret = nvif_driver_init(NULL, nouveau_config, nouveau_debug, "drm",
> +			       nouveau_name(dev), &drm->master.base);
> +	if (ret)
> +		goto fail_alloc;

Why move it above alloc_workqueue()?

> +
>   	drm->sched_wq = alloc_workqueue("nouveau_sched_wq_shared", 0,
>   					WQ_MAX_ACTIVE);
>   	if (!drm->sched_wq) {
>   		ret = -ENOMEM;
> -		goto fail_alloc;
> +		goto fail_nvif;
>   	}
>   
>   	ret = nouveau_cli_init(drm, "DRM-master", &drm->master);
> @@ -674,6 +678,8 @@ nouveau_drm_device_init(struct drm_device *dev, struct nvkm_device *nvkm)
>   	nouveau_cli_fini(&drm->master);
>   fail_wq:
>   	destroy_workqueue(drm->sched_wq);
> +fail_nvif:
> +	nvif_client_dtor(&drm->master.base);
>   fail_alloc:
>   	nvif_parent_dtor(&drm->parent);
>   	kfree(drm);
> @@ -728,6 +734,7 @@ nouveau_drm_device_fini(struct drm_device *dev)
>   	nouveau_cli_fini(&drm->client);
>   	nouveau_cli_fini(&drm->master);
>   	destroy_workqueue(drm->sched_wq);
> +	nvif_client_dtor(&drm->master.base);
>   	nvif_parent_dtor(&drm->parent);
>   	mutex_destroy(&drm->clients_lock);
>   	kfree(drm);

