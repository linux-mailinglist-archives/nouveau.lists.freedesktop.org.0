Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C193890687
	for <lists+nouveau@lfdr.de>; Thu, 28 Mar 2024 18:01:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574B110ED39;
	Thu, 28 Mar 2024 17:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VvCtkAZK";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB1F10ED39
 for <nouveau@lists.freedesktop.org>; Thu, 28 Mar 2024 17:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711645261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qd6vtGEjaeTzV1f2AcS0milHcb/EgWIylwqRgm6gjBE=;
 b=VvCtkAZKnJm232jezyYiVbojwMJ+lWN6nfb5TDihSDlwhY9TQZT9v87m7df888gQWvhMlN
 Ue4DQjamgpTJFrgTuYX/HReIvh2J1R2+k93sHcZXXoC6N3+Vel/EFQXypWSlCdnuIq8alO
 TdlFYwvsKMr2C/XkAo2fVSL1Dd+QOwo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-nvSlb6CkPJim1ohf28Y2lg-1; Thu, 28 Mar 2024 13:00:58 -0400
X-MC-Unique: nvSlb6CkPJim1ohf28Y2lg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4140225e68aso5599865e9.1
 for <nouveau@lists.freedesktop.org>; Thu, 28 Mar 2024 10:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711645257; x=1712250057;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qd6vtGEjaeTzV1f2AcS0milHcb/EgWIylwqRgm6gjBE=;
 b=gvZSTSbSzXkpCBRLzwbphvdIy5zxeopeZcRWEzPW5OVPnBhTsJxOwbi3q6N0t3FS6I
 vt56QjZHaAvcyRnMwy6ifAo2lDzU+q2ubtTETJFifKqme9E5CP+JMTM8+Fvw7JyPFsiN
 a1hfd/SYrhhyEi9PhDmw5/+98skUAdyrqMHp3MQGP0KBX7SqCiLWRGCqpNnY8UJzn35N
 KKz14OTEswPNEszgWI3GjPHPCMcIjHmZ/xnR8Pmz6k6HARqczemkgrEvz7mwpRZgzhur
 ojNxIM2xmvmfsV9O6B8Ap1e5WCkE6wwsQdrytTWcXDTnbRzRN8rXAmGT+3b+yRhDbXtO
 hZQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzaWqln6nwhMU5cMOsCsHauDYJTOdz5t9OofwPYG28RmPV42QkXhLJn4tyEKMQQM/7J+YYEBoPw+e93I2QW6qj+z3Je3PDUiQfJ5Kcnw==
X-Gm-Message-State: AOJu0YyHQd2FxlfRkIUe+dxGzDs3zltVr8bFpjY4229g1KV5a/N+Mt1N
 3UTe/FoTxd6YGAF3Ok4EMxUmWABN3DVTqZ8bqY7ozFbV8LPsuLOVrnY38rxUscosUGliPYVM0fc
 R5U3ePauCVBkASxmKIj+Z+DSH0/mdgU4deq7DcpYyqS+jujBkONNpPkZMik+uOhU=
X-Received: by 2002:a05:600c:1546:b0:414:c5:8503 with SMTP id
 f6-20020a05600c154600b0041400c58503mr2315134wmg.38.1711645257245; 
 Thu, 28 Mar 2024 10:00:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMU1YeDRsoWUWg166ruOHtocc/arSMbGoFCV9vPwHpC+elMIiA2PAku43lcB8JHeDBeeyjlg==
X-Received: by 2002:a05:600c:1546:b0:414:c5:8503 with SMTP id
 f6-20020a05600c154600b0041400c58503mr2315108wmg.38.1711645256913; 
 Thu, 28 Mar 2024 10:00:56 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a05600c4f9200b004148c3685ffsm2893798wmq.3.2024.03.28.10.00.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Mar 2024 10:00:56 -0700 (PDT)
Message-ID: <a3eda30d-920b-4913-a207-a475d490115b@redhat.com>
Date: Thu, 28 Mar 2024 18:00:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/nouveau/gr/gf100: Remove second semicolon
To: Colin Ian King <colin.i.king@gmail.com>, Karol Herbst
 <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240315090930.2429958-1-colin.i.king@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240315090930.2429958-1-colin.i.king@gmail.com>
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

On 3/15/24 10:09, Colin Ian King wrote:
> There is a statement with two semicolons. Remove the second one, it
> is redundant.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied, thanks!

> ---
>   drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> index 986e8d547c94..060c74a80eb1 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> @@ -420,7 +420,7 @@ gf100_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *fifoch,
>   			return ret;
>   	} else {
>   		ret = nvkm_memory_map(gr->attrib_cb, 0, chan->vmm, chan->attrib_cb,
> -				      &args, sizeof(args));;
> +				      &args, sizeof(args));
>   		if (ret)
>   			return ret;
>   	}

