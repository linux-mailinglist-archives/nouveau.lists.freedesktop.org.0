Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69579829D4B
	for <lists+nouveau@lfdr.de>; Wed, 10 Jan 2024 16:15:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BCA10E78E;
	Wed, 10 Jan 2024 15:15:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABAE010E61E
 for <nouveau@lists.freedesktop.org>; Wed, 10 Jan 2024 15:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704899742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5JGJI1VcJxIq9FSZAk+YXHh5hWwjkFg4rzjnZUUwDRs=;
 b=JxnLaiNSs1ru3MaFGv6+x1S83hQd6iHze6uRayksUtmd2K6nG50Shp95nrZUOV+vBqJMax
 lfWADB+Jr+yUNiABwb5VX8bXiWjaCtCZZ5G47q4/zCVDWAImed8LTUgvgr0UV/Il7Lkgy/
 NgoRUsmVwDlQ8N0v9sW5kzySUU1TFcU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-6_z8CLtbMsGo8aiuR8cxOg-1; Wed, 10 Jan 2024 10:15:41 -0500
X-MC-Unique: 6_z8CLtbMsGo8aiuR8cxOg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-40d5ab2fbc9so33648015e9.3
 for <nouveau@lists.freedesktop.org>; Wed, 10 Jan 2024 07:15:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704899740; x=1705504540;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5JGJI1VcJxIq9FSZAk+YXHh5hWwjkFg4rzjnZUUwDRs=;
 b=aTNs6V8UclyesluIsuOxt7zZxdL8sdAWz5S0g+l1iD4DuqB3UmTDOSLWap5r5W1D0G
 FRTBNF1rXJoU+WBC70Zj2x+47ZZBctkgnKqGwTZtf3Q4Mz2UYBq8lT4XJpvf5L59k/jk
 gb47zZy/N5EizBzOwsQM2X5ZCRlmTy6/fObNZ9djYUzWdsaOx4sn8Akk+lS8GZwilmt1
 fKGiRiP8iKcI39tRV+au/ywN2CENiCWNdG2CdpX5vEj0djtcIjHdFG3fXiN8Z0iEJAck
 /7rQ820Lq+QPwZeqQJZp/i0388h7jy7BIVsPHTydGVv9KeYKFm4SMikxuEtPVvkvzdCb
 WkbQ==
X-Gm-Message-State: AOJu0Yxb+rAPlAgY2V0073IFt8kIzXAkfyaNXL/jQPKUL7BQT4HWKrE0
 vQclHFNygeAD+EO92TDMXb5XqSycHKMbx5Qn5Kx1X7CYfAkiFPpPjNM0bFkE/o6e+Dmuj2OTTZB
 Abd5vSiiDmynFJxHsWu7kJC1BkWPmnwSdtA==
X-Received: by 2002:a05:600c:1f83:b0:40e:370b:4298 with SMTP id
 je3-20020a05600c1f8300b0040e370b4298mr604828wmb.121.1704899740220; 
 Wed, 10 Jan 2024 07:15:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHV1mAnohcPqa6WbaN10hLF2MjTnkWjenEX7L+NbOpBinPvlTLE2blAeeYMSnT60VguWzpeOQ==
X-Received: by 2002:a05:600c:1f83:b0:40e:370b:4298 with SMTP id
 je3-20020a05600c1f8300b0040e370b4298mr604816wmb.121.1704899739941; 
 Wed, 10 Jan 2024 07:15:39 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 fa24-20020a05600c519800b0040e490cb666sm2441340wmb.12.2024.01.10.07.15.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 07:15:39 -0800 (PST)
Message-ID: <c8bbb32d-5fc5-4682-a92c-e5e102fa0866@redhat.com>
Date: Wed, 10 Jan 2024 16:15:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux-next v2] drm/nouveau/disp: switch to use kmemdup()
 helper
To: yang.guang5@zte.com.cn
References: <202401091424115185126@zte.com.cn>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <202401091424115185126@zte.com.cn>
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
Cc: keescook@chromium.org, cgel.zte@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chen.haonan2@zte.com.cn, bskeggs@redhat.com,
 jiang.xuexin@zte.com.cn, nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 1/9/24 07:24, yang.guang5@zte.com.cn wrote:
> From: Chen Haonan <chen.haonan2@zte.com.cn>
> 
> Use kmemdup() helper instead of open-coding to
> simplify the code.
> 
> Signed-off-by: Chen Haonan <chen.haonan2@zte.com.cn>
> Reviewed-by: Yang Guang <yang.guang5@zte.com.cn>

Applied to drm-misc-next, thanks!

> ---
>   drivers/gpu/drm/nouveau/nvif/outp.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
> index 5d3190c05250..6daeb7f0b09b 100644
> --- a/drivers/gpu/drm/nouveau/nvif/outp.c
> +++ b/drivers/gpu/drm/nouveau/nvif/outp.c
> @@ -452,13 +452,12 @@ nvif_outp_edid_get(struct nvif_outp *outp, u8 **pedid)
>   	if (ret)
>   		goto done;
> 
> -	*pedid = kmalloc(args->size, GFP_KERNEL);
> +	*pedid = kmemdup(args->data, args->size, GFP_KERNEL);
>   	if (!*pedid) {
>   		ret = -ENOMEM;
>   		goto done;
>   	}
> 
> -	memcpy(*pedid, args->data, args->size);
>   	ret = args->size;
>   done:
>   	kfree(args);

