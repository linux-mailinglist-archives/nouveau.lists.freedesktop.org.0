Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E938FB100
	for <lists+nouveau@lfdr.de>; Tue,  4 Jun 2024 13:24:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C791210E304;
	Tue,  4 Jun 2024 11:24:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VyeX/B5o";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931EF10E304
 for <nouveau@lists.freedesktop.org>; Tue,  4 Jun 2024 11:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717500257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IBeCEXLPJsHhbGdxzAUSQ3t2HWtNcGe9IP3V8Z5rD3g=;
 b=VyeX/B5ov9YqmX2rQ+cUwXfDP1usrQxW4cuKWpVnzqqmFhuRV+5EudHC33kDthOrkV78k5
 PptH9e1jhlne7IE9Xe6mMwC1yl4atrbysY0IS4/DgXtvR3iyJcBtxhIm7UH5SIZD8vA4Yb
 LZRnWCXxVFdyLouzHNru3u/3yJbmXjk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-PZ2I3_T4OLm-xEtTMgG1IA-1; Tue, 04 Jun 2024 07:24:15 -0400
X-MC-Unique: PZ2I3_T4OLm-xEtTMgG1IA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-35dc0949675so3999514f8f.3
 for <nouveau@lists.freedesktop.org>; Tue, 04 Jun 2024 04:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717500254; x=1718105054;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IBeCEXLPJsHhbGdxzAUSQ3t2HWtNcGe9IP3V8Z5rD3g=;
 b=ObYht/mTLxRsYXx53qzxBRkFjGbKVyhekcaSlCdel1/oDUvEtc8z2je6dUU47GrG8j
 loLEXKXkLicBRgaDoPc6ENr4h218U5usxGvdtFaAuD/LW8KsYC+a3OBnBvpjiY4epjQq
 U1N4oXwM706bQNcxnC7nJGE3cm436m5h5bmCG/JLncPymbDj55HxOAYd4O4dSs65rY9p
 elrHR3KRSQjM8M/D3u0+8T3hcxh9hUinNu6a5cXZhHrExCSq/ibBI+brTb6QWQ4nyXCT
 Xmiz+5JrvCIq3NRX4aEAaqDloTPHfZkpxOHwR+9ZeXeEGMme1Wk9w97ifLotqxO809Fj
 /R7g==
X-Gm-Message-State: AOJu0Yx3xKsRvGJBPotCiphsqE1yA2L1MIue8Kd5IZ8DooPib6xyj5OY
 eYeYW39PUbvnUO2XE6Vqgd/VqunwCDgN3OQVEwWoIMZ9cxxIMz2yEejiOrf7BVYfD13J2hMOYV7
 e8yZ5uKYiGrVeLzpmUcFtlJyL7g8r6NEYJ04Y9lEtSWHqJXg02J9lbUU+sEhwhryAu+6Fkms=
X-Received: by 2002:a5d:6da9:0:b0:35e:5be5:fc2 with SMTP id
 ffacd0b85a97d-35e5be5115fmr5453768f8f.67.1717500254336; 
 Tue, 04 Jun 2024 04:24:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9TkBEWMJCoX9anAEJ5Cf16LUU5QhEeQYfX8x+IBYi3cKvtD/CGADNAdUuG5KkcKlMgpqQhQ==
X-Received: by 2002:a5d:6da9:0:b0:35e:5be5:fc2 with SMTP id
 ffacd0b85a97d-35e5be5115fmr5453748f8f.67.1717500253864; 
 Tue, 04 Jun 2024 04:24:13 -0700 (PDT)
Received: from [10.32.64.131] (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd064b684sm11407584f8f.100.2024.06.04.04.24.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jun 2024 04:24:13 -0700 (PDT)
Message-ID: <770a148c-fe52-460b-a658-2766ad54e08e@redhat.com>
Date: Tue, 4 Jun 2024 13:24:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/34] drm/nouveau: create pci device once
From: Danilo Krummrich <dakr@redhat.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: nouveau@lists.freedesktop.org
References: <20240527141959.59193-1-bskeggs@nvidia.com>
 <20240527141959.59193-2-bskeggs@nvidia.com>
 <1ca96b14-1a18-4e6d-bbd2-954538aaa48b@redhat.com>
Organization: RedHat
In-Reply-To: <1ca96b14-1a18-4e6d-bbd2-954538aaa48b@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 6/4/24 12:11, Danilo Krummrich wrote:
> On 5/27/24 16:19, Ben Skeggs wrote:
>> HW isn't touched anymore (aside from detection) until the first
>> nvif_device has been allocated, so we no longer need a separate
>> probe-only step before kicking efifb (etc) off the HW.
>>
>> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
>> ---
>>   drivers/gpu/drm/nouveau/nouveau_drm.c | 11 ++---------
>>   1 file changed, 2 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c 
>> b/drivers/gpu/drm/nouveau/nouveau_drm.c
>> index a58c31089613..c37798b507ea 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
>> @@ -803,23 +803,16 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
>>       /* We need to check that the chipset is supported before booting
>>        * fbdev off the hardware, as there's no way to put it back.
>>        */
>> -    ret = nvkm_device_pci_new(pdev, nouveau_config, "error",
>> -                  true, false, 0, &device);
>> +    ret = nvkm_device_pci_new(pdev, nouveau_config, nouveau_debug,
>> +                  true, true, ~0ULL, &device);
> 
> Looks like we don't need the 'detect' and 'mmio' arguments (anymore),
> can we remove them?

Nevermind, patch 8 already does that. :-)

> 
>>       if (ret)
>>           return ret;
>> -    nvkm_device_del(&device);
>> -
>>       /* Remove conflicting drivers (vesafb, efifb etc). */
>>       ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, 
>> &driver_pci);
>>       if (ret)
>>           return ret;
>> -    ret = nvkm_device_pci_new(pdev, nouveau_config, nouveau_debug,
>> -                  true, true, ~0ULL, &device);
>> -    if (ret)
>> -        return ret;
>> -
>>       pci_set_master(pdev);
>>       if (nouveau_atomic)
> 

