Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 540296727AA
	for <lists+nouveau@lfdr.de>; Wed, 18 Jan 2023 20:00:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B1310E218;
	Wed, 18 Jan 2023 19:00:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB10410E218
 for <nouveau@lists.freedesktop.org>; Wed, 18 Jan 2023 19:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674068411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6VHgRLoz21ZdB+avm4AD7iQRbs1S2YR2I/6RIM3KpT8=;
 b=Ex7B5y8jgcwdkdp42+oriYn/5W7VDyRNf/K4PXWBTwFaVi0LM7pIbHMeXXLP9Kvf+0WZz9
 rwDqeuUQ5hYIf52NxGFlChqm/5xf2jCVSnolSARKAu01ai53OgMV5Gl1VbYWBJUQTBCBdY
 fOUfuaVlbQtdNKlRuryS7qJh130j5h8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-569-92H8rry7OiWrAvf4Rna6EA-1; Wed, 18 Jan 2023 14:00:04 -0500
X-MC-Unique: 92H8rry7OiWrAvf4Rna6EA-1
Received: by mail-ed1-f70.google.com with SMTP id
 v8-20020a056402348800b0049e1913bd43so6736186edc.20
 for <nouveau@lists.freedesktop.org>; Wed, 18 Jan 2023 11:00:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6VHgRLoz21ZdB+avm4AD7iQRbs1S2YR2I/6RIM3KpT8=;
 b=ntGKFscM+u8jWV+6WhxX6uWtgimhH0+nLpfY172lYhjBNzrtshgVB+iDk+6wvDnlyy
 NZRI6ufVtxK221qeOTVOKAyuTTSoZ15pl4/7EBhBY+w7JZMDNa7McSTty/8EGDcV77rL
 VujpspNRcBAPkc2xgKS5lEs6fnhWuwrt12si0QqgSujvd53PH5meiPoREtsFIVmk/gP/
 sR1iCToc5xbCtsSipGpGe9mR9Cyvg22bqN8rZ1hyqwQauYuJd2VHoPDb2r18HW9ncsc5
 nyOC3NSmLc2A0v/G1HqCBMXX0qZU4Ta+Fpn18MXrbymc9MJMJjyvgsdqcCi5HOAD/EN+
 dlRg==
X-Gm-Message-State: AFqh2kq7vfk2n2K8YaLhrfDLk3LCIaXpnDEeyOICY57WYVO+l0GZNe8b
 i11aqwsiNdGIMcP+ecc+aHaf0JH76GNsDjw8eOf/HNB7aWMT2+2KvYuyR9acgHE09C0h9qmFN6G
 cmBaeGpJ2qqRfaw7RPcJpvmNycg==
X-Received: by 2002:a17:907:8dca:b0:85f:5d72:1841 with SMTP id
 tg10-20020a1709078dca00b0085f5d721841mr8927964ejc.39.1674068402955; 
 Wed, 18 Jan 2023 11:00:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtsdunAhuQoXTg/VSvgVA6q/ZXPxkW/qMVvnmose4gPIQY/RC2Jhhnm+VqSnkVslMwPuQBExQ==
X-Received: by 2002:a17:907:8dca:b0:85f:5d72:1841 with SMTP id
 tg10-20020a1709078dca00b0085f5d721841mr8927939ejc.39.1674068402689; 
 Wed, 18 Jan 2023 11:00:02 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a1709061be100b0086f40238403sm5244115ejg.223.2023.01.18.11.00.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 11:00:02 -0800 (PST)
Message-ID: <9830b666-b78c-9794-0d4a-7de31b9fd9b5@redhat.com>
Date: Wed, 18 Jan 2023 20:00:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 daniel@ffwll.ch, airlied@redhat.com, bskeggs@redhat.com,
 jason@jlekstrand.net, tzimmermann@suse.de, mripard@kernel.org, corbet@lwn.net
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-3-dakr@redhat.com>
 <3c3bd64a-164b-7ff2-ebf0-c8f9c2f94b72@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <3c3bd64a-164b-7ff2-ebf0-c8f9c2f94b72@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH drm-next 02/14] drm/exec: fix memory leak in
 drm_exec_prepare_obj()
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 1/18/23 09:51, Christian König wrote:
> That one should probably be squashed into the original patch.

Yes, just wanted to make it obvious for you to pick it up in case you 
did not fix it already yourself.

> 
> Christian.
> 
> Am 18.01.23 um 07:12 schrieb Danilo Krummrich:
>> Don't call drm_gem_object_get() unconditionally.
>>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_exec.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
>> index ed2106c22786..5713a589a6a3 100644
>> --- a/drivers/gpu/drm/drm_exec.c
>> +++ b/drivers/gpu/drm/drm_exec.c
>> @@ -282,7 +282,6 @@ int drm_exec_prepare_obj(struct drm_exec *exec, 
>> struct drm_gem_object *obj,
>>               goto error_unlock;
>>       }
>> -    drm_gem_object_get(obj);
>>       return 0;
>>   error_unlock:
> 

