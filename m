Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9067B0AAE
	for <lists+nouveau@lfdr.de>; Wed, 27 Sep 2023 18:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D83DE10E574;
	Wed, 27 Sep 2023 16:53:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77BC10E56E
 for <nouveau@lists.freedesktop.org>; Wed, 27 Sep 2023 16:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695833582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rxjtGuP27M/M7llCwr0T0C3cRYx9L/Mjemr/JjBDHmM=;
 b=X0QmpRXgkppN6wnCMsFaKSw807jT079OjmOopSOdS1jI1otDZSHRlFhung1fUDsy8UDJlK
 sfZxwRkZ+DodsM/b1Hg3QrFuuXJ9vFyXG9JfaifVRn6eRavSP++n8+PfKtXOdK80F0VARx
 2X2WSP6XG6dTOoh3/crKiHFAQZTu3rM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-9B32VNSPMCKlcNsXumbK_w-1; Wed, 27 Sep 2023 12:52:58 -0400
X-MC-Unique: 9B32VNSPMCKlcNsXumbK_w-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-9a621359127so992898966b.0
 for <nouveau@lists.freedesktop.org>; Wed, 27 Sep 2023 09:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695833577; x=1696438377;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rxjtGuP27M/M7llCwr0T0C3cRYx9L/Mjemr/JjBDHmM=;
 b=LNG/NDNXRLFhrZg/pvB2hWQp/BZiIh880RGonAFr2S4cDfTNf7AZKGQNKNBllD2EAP
 eWpSGZ0KGQhhIwRCmHuxHzTpycW5jtw9uF8Zcz8ap8CmlXJR2hyhW7yzV5qTIDO2cu5y
 e69IRO1AQtBmEnyLHoAiEOMJHP03bVqWJlGUB3J/t9rGShh4RHLlZVBYz77iSszRanuo
 yYjt+VZm6mNtfBgyfJTttAk6xGowkjQvZrWtUXROgFnBiD/DViWhBa1FuVedacKhwQiq
 /HA9xWooWeNCsCAlSCwtb0dlCPOpLOJ7tfwer0uxfAqipiYoTYVvOQyonWjagjp3ZPF2
 suVg==
X-Gm-Message-State: AOJu0Ywl7Bzto7S63CNRX014Ky0MR0fZ3jpyqpm2s88mkXjYg5qQgcVN
 KSS096f5DES+aatNph/Rjh/X4Tg1jxEyYejJ7PcEGZV4ZeUUpoFoJrStt1znIJbF9icC0jKT/IA
 onTMgfiyB0jU96EXZb2uymSod3Q==
X-Received: by 2002:a17:907:77c5:b0:9ae:505d:310b with SMTP id
 kz5-20020a17090777c500b009ae505d310bmr2306328ejc.39.1695833577405; 
 Wed, 27 Sep 2023 09:52:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHc83/1tUjQ09zzLgVnnHRK2VLhOicSElrnrdTxCdR6t80pKF0wAdKYoaj3LU1idXVGIDZCA==
X-Received: by 2002:a17:907:77c5:b0:9ae:505d:310b with SMTP id
 kz5-20020a17090777c500b009ae505d310bmr2306309ejc.39.1695833577104; 
 Wed, 27 Sep 2023 09:52:57 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a170906970f00b0098733a40bb7sm9562757ejx.155.2023.09.27.09.52.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Sep 2023 09:52:56 -0700 (PDT)
Message-ID: <810dc476-8ead-19e6-23fc-0f9cf35ba2b2@redhat.com>
Date: Wed, 27 Sep 2023 18:52:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230920144343.64830-1-dakr@redhat.com>
 <20230920144343.64830-7-dakr@redhat.com>
 <20230922135842.242c865d@collabora.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230922135842.242c865d@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH drm-misc-next v4 6/8] drm/gpuvm: add
 drm_gpuvm_flags to drm_gpuvm
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 donald.robson@imgtec.com, daniel@ffwll.ch, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 9/22/23 13:58, Boris Brezillon wrote:
> On Wed, 20 Sep 2023 16:42:39 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
>> +/**
>> + * enum drm_gpuvm_flags - flags for struct drm_gpuvm
>> + */
>> +enum drm_gpuvm_flags {
>> +	/**
>> +	 * @DRM_GPUVM_USERBITS: user defined bits
>> +	 */
>> +	DRM_GPUVM_USERBITS = (1 << 0),
> 
> Nit: I tried declaring driver-specific flags, and I find this
> counter-intuitive. You basically end up with something like:
> 
> enum my_gpuvm_flags {
> 	MY_FLAG_X = DRM_GPUVM_USERBITS,
> 	MY_FLAG_Y = DRM_GPUVM_USERBITS << 1,
> };
> 
> instead of the usual
> 
> enum my_gpuvm_flags {
> 	MY_FLAG_X = BIT(0),
> 	MY_FLAG_Y = BIT(1),
> };
> 
> pattern.

Right, same as with dma_fence flags.

> 
> Another issue I see coming is if we end up adding more core flags and
> drivers start falling short of bits for their own flags. This makes me
> wonder if we shouldn't kill this notion of USER flags and let drivers
> store their flags in some dedicated field, given they're likely to
> derive drm_gpuvm and drm_gpuva with their own object anyway.

The only reason I have this in the code is that Xe asked for this with
drm_gpuva_flags. Hence, for consistency reasons I added it for drm_gpuvm_flags
too.

Drivers can still have their own flag fields if needed, otherwise I guess it
doesn't really hurt to keep DRM_GPUVM_USERBITS in case someone wants to use it.

> 
>> +};
>> +
> 

