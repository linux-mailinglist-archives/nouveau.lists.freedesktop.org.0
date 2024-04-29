Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 150F48B6619
	for <lists+nouveau@lfdr.de>; Tue, 30 Apr 2024 01:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B258C10E439;
	Mon, 29 Apr 2024 23:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="E0wOqLas";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F62010E46F
 for <nouveau@lists.freedesktop.org>; Mon, 29 Apr 2024 23:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714432610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mfLx3YYQYDI2fQfZd7hxAX01vHPJP0y0RCss9IRqtlc=;
 b=E0wOqLaszoUyt59CBJS68HokxjfappOiQdKBruBnRzPKBnGME/Zy5catXlKyFlj8NJ4tZA
 bs4EUr1D4O2/eidhcJ9ELap1CvL0UfoWxDKr/wEvO1PcoHAMrvBO6X/GRDxcOHnqkRZCtu
 OxG0hwxrW0ylvcrRnemOvwmRFknGCIk=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-184-VPM9VNneNwiPX9i0nPNxVQ-1; Mon, 29 Apr 2024 19:16:48 -0400
X-MC-Unique: VPM9VNneNwiPX9i0nPNxVQ-1
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-60f502e1671so3120575a12.0
 for <nouveau@lists.freedesktop.org>; Mon, 29 Apr 2024 16:16:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714432607; x=1715037407;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mfLx3YYQYDI2fQfZd7hxAX01vHPJP0y0RCss9IRqtlc=;
 b=vmgyG7zipZw4EgOiuRYdhqFDjlhF4FG4idt+QNK588NpxkuJLKT8ap6JCzJq9RpuvK
 U5aXwDJZr3htTzu+rP8Ih4/eL8TCadrALOCX4qEbc2bhQDdEe6qmYHKK6rxiH7Yrldf6
 FzkjDf+dzRTQLbC1XBNkyZTym9x35WHHgvvNmAoY2i8QIy37CO1fuYsR5BiJTzcbYDt7
 PJ3vT74giiROKW+wvx9+4yPaZho1Ipl9b/zdzenTRFBlimpRfua5wCYZpF/KouU02rNc
 1R8KQRllydZWTfOPHnxdtbXhDQ2wyvqOHeZgid9LxjnjPPKYBKGh0ooSxgvWM/j8A/wT
 SClQ==
X-Gm-Message-State: AOJu0YzdOa4jovlpMPEwP81dBpCP2J2aF9gZZgzdZlk0xS9ZKLVKMZ0D
 aTiIL77jeyEX8Ns0cHlv7VsdXlJYno4b5M055M5hHxyrJrNDX459AzBNgdIqRDzk7ju7oXv2IEk
 Fs/eizJrDG5uYudCQ9rh1bRyxEYG+JBHsH3uN7uYdYRzMXCp8tuCcTBIzHlxulIiuYkyHgc14zT
 2RpRggw+t/QwtXVQomnXOnQx+tRYUdGV818DVOfw==
X-Received: by 2002:a05:6a21:3d89:b0:1ad:ab1:9816 with SMTP id
 bj9-20020a056a213d8900b001ad0ab19816mr11473216pzc.22.1714432607699; 
 Mon, 29 Apr 2024 16:16:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUZvpgPpaOa7H3d2aoUN1Xb/LVQlTAnMr5zKAT1c4HSshzaCk3AJvVbkJJT4xPOcLPr0FgQhO+FGEq+TsZz1w=
X-Received: by 2002:a05:6a21:3d89:b0:1ad:ab1:9816 with SMTP id
 bj9-20020a056a213d8900b001ad0ab19816mr11473202pzc.22.1714432607350; Mon, 29
 Apr 2024 16:16:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240426154138.64643-1-lyude@redhat.com>
 <20240429182318.189668-1-lyude@redhat.com>
In-Reply-To: <20240429182318.189668-1-lyude@redhat.com>
From: David Airlie <airlied@redhat.com>
Date: Tue, 30 Apr 2024 09:16:35 +1000
Message-ID: <CAMwc25pVJccw6vJtzo9N5qPeKBOpnVTSpQn0TPt9bYx_ECcXqg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/nouveau/firmware: Fix SG_DEBUG error with
 nvkm_firmware_ctor()
To: Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Karol Herbst <kherbst@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Justin Stitt <justinstitt@google.com>, 
 Kees Cook <keescook@chromium.org>, Ben Skeggs <bskeggs@redhat.com>, 
 open list <linux-kernel@vger.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

> V2:
> * Fixup explanation as the prior one was bogus

For v2 of both patches,

Reviewed-by: Dave Airlie <airlied@redhat.com>

Please apply to drm-misc-fixes

Dave.

