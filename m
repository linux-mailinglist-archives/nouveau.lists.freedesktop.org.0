Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D637E4620
	for <lists+nouveau@lfdr.de>; Tue,  7 Nov 2023 17:35:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D802F10E617;
	Tue,  7 Nov 2023 16:35:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5706110E617
 for <nouveau@lists.freedesktop.org>; Tue,  7 Nov 2023 16:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699374931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tiblu4ip97uUBovXyyp2LXTdUMhVr/Onp/Dhl6Jr+ik=;
 b=RkuRdfL8ycLlTc5+VaCq5Pe+q6/RGqA/cn01nSBuv/l+x6EvTfrRnIM+sgWVtvEheX/mXZ
 9/tlV9AwbBfie74XiX5qep1uZgvrfWp+Hl8OAAex2Al1eEPOlPr2HnLjCLhXogkdw+SYpV
 yhWqBKPZPRTBkHf15LO52IqOClJ18P4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-juoeS0gPM2inKa1UuRN5kg-1; Tue, 07 Nov 2023 11:35:28 -0500
X-MC-Unique: juoeS0gPM2inKa1UuRN5kg-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9ae686dafedso433952566b.3
 for <nouveau@lists.freedesktop.org>; Tue, 07 Nov 2023 08:35:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699374927; x=1699979727;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tiblu4ip97uUBovXyyp2LXTdUMhVr/Onp/Dhl6Jr+ik=;
 b=U61087sJVeAdTa8Q3RAOOqvztJv3fLL14M4WhvjBowKC5gOsGTSsFlxrApTv/Lm2l0
 BX7bzEFcPCQHE4Kt/MP39Rv0uiH83ENq+ugw8lUlKcaf/a/t+k67x0ftr2t7NDu1v/vJ
 x/F+mpNas3EKbKvP4J+uEeCjBctN+5u3ZhOWLK1lfqL19nCgZ3zNGdtsIlpjs1P8rqoe
 pELqpTNlsh14jFMQXUxGOKyo769YQr4ZgTwGKSl/NfSKBlnGhS0S2WOp1vX4zTh7cGM8
 F+RmrSwsvcsHTtyKQA5R1I2nCqxavKF/wPk/exv/UsB/ZTjq20TT8vSa/H+XVQf6i1EH
 euRw==
X-Gm-Message-State: AOJu0Yz/3tNWV8os/KVTK13DVYY48D4rMZ5yKDxBGH2NwaNpSZBkYGWw
 rl1lYbmbeJP3IKr1EW11AFDmaWVQw6ZT9/U3JXyCbo20FGn0lD1A7PZKe9ZI7auuV+jZ+1Pqy8o
 dMv5uFkkOxxTCkfBkvJw27RQI/g==
X-Received: by 2002:a17:907:7291:b0:9b2:cf77:a105 with SMTP id
 dt17-20020a170907729100b009b2cf77a105mr15589058ejc.15.1699374926959; 
 Tue, 07 Nov 2023 08:35:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8JsrYEEW27MiEbhdjSSOwrNJh24aPmwE/kn5KJu4CIuZCg740CWk0jYDGQcM1hSN32EW/rQ==
X-Received: by 2002:a17:907:7291:b0:9b2:cf77:a105 with SMTP id
 dt17-20020a170907729100b009b2cf77a105mr15589046ejc.15.1699374926647; 
 Tue, 07 Nov 2023 08:35:26 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a1709066a8900b009d23e00a90esm1216102ejr.24.2023.11.07.08.35.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Nov 2023 08:35:26 -0800 (PST)
Message-ID: <a7ea2ea5-3014-4de1-a93c-5b667fd0246b@redhat.com>
Date: Tue, 7 Nov 2023 17:35:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <1d864f6e-43e9-43d8-9d90-30e76c9c843b@moroto.mountain>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <1d864f6e-43e9-43d8-9d90-30e76c9c843b@moroto.mountain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH] nouveau/gsp/r535: uninitialized variable in
 r535_gsp_acpi_mux_id()
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
Cc: nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 11/7/23 16:18, Dan Carpenter wrote:
> The if we hit the "continue" statement on the first iteration through
> the loop then "handle_mux" needs to be set to NULL so we continue
> looping.
> 
> Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Good catch!

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

@Dave: Can't pick this patch up myself, since this should probably go into
drm/topic/nvidia-gsp.

> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index e31f9641114b..afa8e7377a76 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -1159,7 +1159,7 @@ static void
>   r535_gsp_acpi_mux_id(acpi_handle handle, u32 id, MUX_METHOD_DATA_ELEMENT *mode,
>   						 MUX_METHOD_DATA_ELEMENT *part)
>   {
> -	acpi_handle iter = NULL, handle_mux;
> +	acpi_handle iter = NULL, handle_mux = NULL;
>   	acpi_status status;
>   	unsigned long long value;
>   

