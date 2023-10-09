Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7097C7BED8B
	for <lists+nouveau@lfdr.de>; Mon,  9 Oct 2023 23:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF12A10E1B1;
	Mon,  9 Oct 2023 21:47:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC1710E1B1
 for <nouveau@lists.freedesktop.org>; Mon,  9 Oct 2023 21:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696888057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ol7U8OKowEqtq5uPO63v6h+CJlOTYPJm/cIb2Hh14MU=;
 b=YjwMjxIiCzSzVzvbKRDdNWL5jpQ5wp3AKrrO7TTWHTnZRasyLSRvug4TDzOJMc5eQCGh9j
 RejoDSvNoC4JXbK4OfiAW40VxLe4L1HszXc0YTA95ZSDWx4P+LCtjEKOZUP9y38jEBgbJB
 l/LhfK0OyQ1zuKB74kqeSl6ipj9DPkY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-jzevpfuPOM2Dp67xOlasmQ-1; Mon, 09 Oct 2023 17:47:36 -0400
X-MC-Unique: jzevpfuPOM2Dp67xOlasmQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-66ac99ce80eso60850986d6.1
 for <nouveau@lists.freedesktop.org>; Mon, 09 Oct 2023 14:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696888056; x=1697492856;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ol7U8OKowEqtq5uPO63v6h+CJlOTYPJm/cIb2Hh14MU=;
 b=Np+/eoXzKvBDprDCCjWJtzROTkq8E+jF0EGp2OcNpvZFZmpOlHWZ4ewAvxf7oHU2uh
 g3wjtmYxpAFv7O5E7f+TCBcZavPvATb1e6QbGbBkrQKlgESUg+61lAs/KaBTVQe7FMlq
 wbH4TXGrp/3hbUzPZCyTPjWnYTxdiC01c/jt/1ohPYE/A/b0vw61vDEqlDcQnMlJi1hY
 tmDqxoW+mJZmH2nkrktJb2VyD4rcVURQxvhPBn+sfC0koW7gm7Yf35MrHp9mIaiN5Yyq
 ZpU9QC6+lRpvgptHqJwlCOMhi5YaYPmeAEQEjqjEx2Tun/AnkOaVa/aTLGu9eC3p0hUM
 jgpA==
X-Gm-Message-State: AOJu0YwWtSlC+hxCp1GCa0jkHm6PkT/l81bgyQOEzPqsK6P0QgcanCYW
 omNOllBXo2NkraF9rc6cA0IDlCLw5q2mZ85d8xW2YtqYJfpvdTMKkRrTBu78HAcT65MgNh8Y9s+
 087FPp0ZmEs0IoxpAUrlJ+vIG/A==
X-Received: by 2002:a0c:dd87:0:b0:658:a043:376b with SMTP id
 v7-20020a0cdd87000000b00658a043376bmr17087606qvk.8.1696888056227; 
 Mon, 09 Oct 2023 14:47:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOke8zf4DZ25JuBWmIWAQ89mvWVhG4qPWk2Q0cT+WH8YONLgZ9WVcabvZ/wTXpE0AjungOEQ==
X-Received: by 2002:a0c:dd87:0:b0:658:a043:376b with SMTP id
 v7-20020a0cdd87000000b00658a043376bmr17087594qvk.8.1696888056012; 
 Mon, 09 Oct 2023 14:47:36 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 z19-20020a0cda93000000b0065b31dfdf70sm4173364qvj.11.2023.10.09.14.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 14:47:35 -0700 (PDT)
Message-ID: <e494d9fe7efd72ca3588710388411e98c82ff3f7.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Date: Mon, 09 Oct 2023 17:47:35 -0400
In-Reply-To: <20231007005518.32015-1-rdunlap@infradead.org>
References: <20231007005518.32015-1-rdunlap@infradead.org>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau: exec: fix ioctl kernel-doc
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
Cc: Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Fri, 2023-10-06 at 17:55 -0700, Randy Dunlap wrote:
> include/uapi/drm/nouveau_drm.h:49: warning: Cannot understand  * @NOUVEAU=
_GETPARAM_EXEC_PUSH_MAX
>  on line 49 - I thought it was a doc line
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
> ---
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

