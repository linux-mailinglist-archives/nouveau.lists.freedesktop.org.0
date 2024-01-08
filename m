Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F30882762E
	for <lists+nouveau@lfdr.de>; Mon,  8 Jan 2024 18:19:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4E910E27F;
	Mon,  8 Jan 2024 17:19:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFCB910E27F
 for <nouveau@lists.freedesktop.org>; Mon,  8 Jan 2024 17:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704734339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4n0GXMevIXNEHu349Rlctj8rXBEsAzbKnDlggCcCpro=;
 b=TPiFBAFSzfnEEXpZ3pd05NwdwS7oiNBu4mFLvTzYrtsw4ogSZcpPSqBKethWDBlJUq6prp
 +NcWxhFHR1DGMYHYJqm+j2Vp5O8gIwPZRNAjvM/Hii2e++IzQqXyiksIlZGLmDCpbxDIvv
 +9+TnC9YKj+ibLvooc2Bz4FvDAl51XI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-fX1lhKxiOSeqWfoXEQNkmw-1; Mon, 08 Jan 2024 12:18:58 -0500
X-MC-Unique: fX1lhKxiOSeqWfoXEQNkmw-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7831be985c0so223015185a.3
 for <nouveau@lists.freedesktop.org>; Mon, 08 Jan 2024 09:18:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704734337; x=1705339137;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4n0GXMevIXNEHu349Rlctj8rXBEsAzbKnDlggCcCpro=;
 b=xQD7qde6WoBxbDK9aJuXz1CrTEFIXELRnwuPMS0MTCj0s9FgwBZzJrcQab0D7ka/tr
 93U1cOKE3ccR7XBpiq5hZyEk0DweCLqi73ZeVASlKVI2YeX0CX1YbT5bxtbTbdXw1cWf
 hyRtkUoXkcolpVXZNwt0XGYIbhJ6o9ary0mb+i7LNmh2C9fg2JZQ2GlfAoFNRq/+mNT/
 +qIbM2s6oOtZhpb+ZQWTvhuxn1N42k2mo+lYjf4w0vV5V88lcjLxrQD1cWyvQ+Uw5y6N
 t64oz7+9TbLTr1fQ9KpQPGNXTtW1GbcStfZN4yMcbcbFR07HdZA8ndgBvjm8U7zI2O3z
 sOSg==
X-Gm-Message-State: AOJu0YwyeYrpRnSA1zvCPeLXHG6a4JoXvYmF01MpuYuuCApOIlt4BaN6
 IeEpjwJ+vtgVa0GxnXrHEu1Nqh5yyIxlZOQ7Ya35Kp7URBal1OS5p5mXKqAFFHIWpU6wzd9kvk0
 2+2l585bMPybRXqm3ImYz20/myTlpNdSCxA==
X-Received: by 2002:a05:620a:470a:b0:783:2607:13f5 with SMTP id
 bs10-20020a05620a470a00b00783260713f5mr1285294qkb.20.1704734337503; 
 Mon, 08 Jan 2024 09:18:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbsXsbxoXlECp8+ORoJitLSD8fGeGAumNZ2yTKrmI2VxodrvKisab55OD1FQr1IN7iJllKVQ==
X-Received: by 2002:a05:620a:470a:b0:783:2607:13f5 with SMTP id
 bs10-20020a05620a470a00b00783260713f5mr1285278qkb.20.1704734337276; 
 Mon, 08 Jan 2024 09:18:57 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a05620a25cb00b007830ce180basm43109qko.120.2024.01.08.09.18.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 09:18:56 -0800 (PST)
Message-ID: <9413ee17-70d6-4c27-ad8c-2cd4e0f7bb0b@redhat.com>
Date: Mon, 8 Jan 2024 18:18:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux-next] drm/nouveau/disp: switch to use kmemdup()
 helper
To: yang.guang5@zte.com.cn
References: <202312142003220684160@zte.com.cn>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <202312142003220684160@zte.com.cn>
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
Cc: jiang.xuexin@zte.com.cn, cgel.zte@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chen.haonan2@zte.com.cn, bskeggs@redhat.com,
 daniel@ffwll.ch, nouveau@lists.freedesktop.org, keescook@chromium.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Yang,

On 12/14/23 13:03, yang.guang5@zte.com.cn wrote:
> From: Yang Guang <yang.guang5@zte.com.cn>
> 
> Use kmemdup() helper instead of open-coding to
> simplify the code.
> 
> Signed-off-by: Chen Haonan <chen.haonan2@zte.com.cn>

Please add your "Signed-off-by" tag to this patch. If the above is intended to indicate
that Chan was involved in creating this patch (e.g. as co-author, reporter, etc.) please
use the corresponding tag instead. See also [1].

Once this is fixed, I'll apply the patch.

- Danilo

[1] https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

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

