Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2D67BED70
	for <lists+nouveau@lfdr.de>; Mon,  9 Oct 2023 23:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A439410E068;
	Mon,  9 Oct 2023 21:37:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C83510E068
 for <nouveau@lists.freedesktop.org>; Mon,  9 Oct 2023 21:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696887443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8wiHOUxiajjnHeBrQroPQKoRKotH3a/t84SnD4V8y6c=;
 b=C13M/XqEtAnlH3I18cVX5KMJsElVE4fVsiK4PBjgAVRRWh+bLx1JIBz3UItbIBWLBMGV4K
 hR/mmQ1MeCsH4HiQBJvKgtX2bLJohpdVLTaeU9WXv4MamC4bI1vXUhLw9Uc863AKNm8tg3
 An1KEjV8menjp59fqJiR5y809E//qo8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-triymI0WNWKo_CezmURroQ-1; Mon, 09 Oct 2023 17:37:11 -0400
X-MC-Unique: triymI0WNWKo_CezmURroQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-774294bde69so801287185a.1
 for <nouveau@lists.freedesktop.org>; Mon, 09 Oct 2023 14:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696887431; x=1697492231;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8wiHOUxiajjnHeBrQroPQKoRKotH3a/t84SnD4V8y6c=;
 b=HlFhggOmN7bvbBJe/3DSikLYLJlhgt5fsA9yGFGSRGaGddDyPtpgDO5UM/F8nih1xX
 Yc0UhE0yCMU8poqa5H56qHSa0sEtbQTFO+okIUY90DkUWx9HZ8vPCU4fpRS0gZxViZh9
 Wca3HU63JoYKQs9Iqz6IogTtLXtCu7yIGRo0XIkV9j2W1rdcfnjYHTvL7NVJbjWIu3vH
 ugYomhkMjx4BFD8C3vk5y5XibwVnvJsFNtTSOy+Q+1eR1zbrJpCWl4uPc5i3Gz+PNrVg
 S7aL3PVZ5u888ae8UShDefIaeuAaPbxDewxIcefTg6wpDk3yT2po98X3TJAUK8C4rVhN
 vycQ==
X-Gm-Message-State: AOJu0Yzn/5vIV6YEbtn5f0+NeXGqMI5WGG5CnF4RXcRsoJW61dowhKNt
 54n3DyO7vIg3nQS25R/zqBzMKGk1rm/7SKpk3Fp1RJ09m0qpkelmzn1bDC2ysNlOJRE3M8T648r
 DSMgArVuV43ar9rtOCV2FClCWiw==
X-Received: by 2002:a05:620a:c45:b0:76c:b7f0:2bc9 with SMTP id
 u5-20020a05620a0c4500b0076cb7f02bc9mr18775863qki.16.1696887431223; 
 Mon, 09 Oct 2023 14:37:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1/DJrTyEIdfkS2nqcDd8qD8ykOPTlndQuH0p6ATWLeJ7BelfGg5ljaHhfNFoJXY4wO+aR8w==
X-Received: by 2002:a05:620a:c45:b0:76c:b7f0:2bc9 with SMTP id
 u5-20020a05620a0c4500b0076cb7f02bc9mr18775847qki.16.1696887430939; 
 Mon, 09 Oct 2023 14:37:10 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 v22-20020a05620a123600b0077423f849c3sm3804814qkj.24.2023.10.09.14.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 14:37:10 -0700 (PDT)
Message-ID: <a53adb9e7c598119a490dca20305644d6d7f312a.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Date: Mon, 09 Oct 2023 17:37:09 -0400
In-Reply-To: <20231008140231.17921-1-rdunlap@infradead.org>
References: <20231008140231.17921-1-rdunlap@infradead.org>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH v2] drm/nouveau: exec: fix ioctl kernel-doc
 warning
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
Cc: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Sun, 2023-10-08 at 07:02 -0700, Randy Dunlap wrote:
> kernel-doc emits a warning:
>=20
> include/uapi/drm/nouveau_drm.h:49: warning: Cannot understand  * @NOUVEAU=
_GETPARAM_EXEC_PUSH_MAX
>  on line 49 - I thought it was a doc line
>=20
> We don't have a way to document a macro value via kernel-doc, so
> change the "/**" kernel-doc marker to a C comment and format the comment
> more like a kernel-doc comment for consistency.
>=20
> Fixes: d59e75eef52d ("drm/nouveau: exec: report max pushs through getpara=
m")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
> ---
> v2: update commit text; somehow I sent a version of the patch before
>     adding the full text.
> v1: https://lore.kernel.org/lkml/20231007005518.32015-1-rdunlap@infradead=
.org/
>=20
>  include/uapi/drm/nouveau_drm.h |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff -- a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
> --- a/include/uapi/drm/nouveau_drm.h
> +++ b/include/uapi/drm/nouveau_drm.h
> @@ -45,8 +45,8 @@ extern "C" {
>  #define NOUVEAU_GETPARAM_HAS_BO_USAGE    15
>  #define NOUVEAU_GETPARAM_HAS_PAGEFLIP    16
> =20
> -/**
> - * @NOUVEAU_GETPARAM_EXEC_PUSH_MAX
> +/*
> + * NOUVEAU_GETPARAM_EXEC_PUSH_MAX - query max pushes through getparam
>   *
>   * Query the maximum amount of IBs that can be pushed through a single
>   * &drm_nouveau_exec structure and hence a single &DRM_IOCTL_NOUVEAU_EXE=
C
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

