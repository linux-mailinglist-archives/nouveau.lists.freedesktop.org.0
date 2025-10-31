Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8C1C22D36
	for <lists+nouveau@lfdr.de>; Fri, 31 Oct 2025 01:52:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A0910E0CC;
	Fri, 31 Oct 2025 00:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="eFbo4yN4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5587810E0CC
 for <nouveau@lists.freedesktop.org>; Fri, 31 Oct 2025 00:52:48 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-640741cdda7so1131792a12.2
 for <nouveau@lists.freedesktop.org>; Thu, 30 Oct 2025 17:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1761871966;
 x=1762476766; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gEQ18anQMYI+7tHFQ9c7MoTWULdEXT6+PJ++e+/5Yis=;
 b=eFbo4yN4FTjJ8CWwWef2iIydNipu/9ZPZKQfGY8SL0eIIjRxJXdw/1asET1gvSf65j
 Bk+tfrOxe6BCNN8ZU5tELtSBUT8ub5vm+REPfgJaVySx7Kf6FPBfGf4zOPH0a+4q8u1l
 l7HugkvwEaiWpKcIBNn99YU90C0S0HlVkS6eJzJEI5k7OQ/YL7cD7lq1hgnDycHbEWh6
 dvf73gr4IR1wcwg3f1BB6kWOASUzfRln4WwImIsgKnMU9N+ic+FkdFfEd63si6qvI0En
 /YGGtBn613d00i3ATyRoBdNXxkRdce2Ijoig+GRI869YbjMxrYfKPNNLqV7Gwws2nRWE
 cxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761871966; x=1762476766;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gEQ18anQMYI+7tHFQ9c7MoTWULdEXT6+PJ++e+/5Yis=;
 b=VFbw/lKmykVqM2maWTXxaYfm1ArC52lYBEl5ZXOSfE/glSMorE9isAGVMGPE8d+3lN
 XoACO7fm6/2qmnouzEKmKPhsOcyp0pBtdCFMLo2Xm72B7kMBL+hddcv9tTVrr7AaCE2X
 fQkLJDE932F6K5ktM/y+ZbQY7jV8+2xlg85klo/10n3eV+yQDoaOjD9zunpVoK5NRi4u
 Uu1Ah/4kLDMn97PFcyJe2pqMgGMgf38+jJBpY80jirXB+b5UaTt5dKscn+hyvPkFEY+y
 jyrAr1leKjV8Sew5ci/vpB15fJkSB6p9IyF2lnLStfURy3hdBcK1tLlvtF7/FBnFyM25
 zE6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpqw88/2MrUV5PwwwmGmVZPhHnpf+/92aKTT7xui8WP1u/Mcpedy6YPXQtHocnWEzQnF4uPA+f@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/cyBmave+k0ZydFUGH4PYcj0xT7g/TtLL4wyjFRALONi/GWcq
 x7yRDvqNDmX71YNQlGKK6rN0KNVR4FqaAqIClgmMY7FXOWPk4P7GvVwn4L0U3jl1HL46ZDA/DQp
 /qkYmqGX0JUdOLxNxF9bbyn+cKPs9J17zwOPYkcp2hw==
X-Gm-Gg: ASbGncs5M6m/z4Q6f40/mTheViqVslchX45c26xrZsKcb4tGgUOUWfGoBESAnYmldrS
 kH09zdN4y7v6lBSHmldxojeTGzuW67CYA+xRQuLCaL4v5BdzmCkTTZQRx7GG8SqS6Bd6lCr9PdF
 /CghR2Czm+StksWmm6yrNcHTateMf7bTYlbfJ+cRzoiGGImanyNzaQrPgQKc9SWFNG80sJ3QFT2
 txnERFrsCgKkIwvEG+3mNAsjsWJnNFpNMgBAhDee83T4bAkfAndinemYvwN
X-Google-Smtp-Source: AGHT+IH2SGUq2JivC0VwG4m1roqAWpSLfoI246C8KIQXIlrqoVKC3sTa2sFKJ2ZdL8ZfCzcdbIrSayRHAHYKBw+6C5s=
X-Received: by 2002:a05:6402:4315:b0:63e:142e:4b18 with SMTP id
 4fb4d7f45d1cf-64076f6beeamr1270481a12.7.1761871965943; Thu, 30 Oct 2025
 17:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <20251030230357.45070-1-mohamedahmedegypt2001@gmail.com>
 <20251030230357.45070-3-mohamedahmedegypt2001@gmail.com>
In-Reply-To: <20251030230357.45070-3-mohamedahmedegypt2001@gmail.com>
From: M Henning <mhenning@darkrefraction.com>
Date: Thu, 30 Oct 2025 20:52:19 -0400
X-Gm-Features: AWmQ_bnsMkSJn0hwatI9MRI7jNKarfabhU-buAXAiUf2EvCIPzigfImDg_Tk7nc
Message-ID: <CAAgWFh02dw=omW-yiBqZ8S7Q2ka79=5eNicXVhBb7Zz_fEB81g@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] drm/nouveau/uvmm: Allow larger pages
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Mary Guillemard <mary@mary.zone>, Faith Ekstrand <faith.ekstrand@collabora.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Oct 30, 2025 at 7:04=E2=80=AFPM Mohamed Ahmed
<mohamedahmedegypt2001@gmail.com> wrote:
> +static bool
> +op_map_aligned_to_page_shift(const struct drm_gpuva_op_map *op, u8 page_=
shift)
> +{
> +       u64 non_page_bits =3D (1ULL << page_shift) - 1;
> +
> +       return op->va.addr & non_page_bits =3D=3D 0 &&
> +              op->va.range & non_page_bits =3D=3D 0 &&
> +              op->gem.offset & non_page_bits =3D=3D 0;
> +}

As discussed on irc/discord, this is buggy because it needs more
parenthesis =F0=9F=A4=A6=E2=80=8D=E2=99=80=EF=B8=8F
