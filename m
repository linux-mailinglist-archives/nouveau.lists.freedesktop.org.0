Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B080DCB1EEB
	for <lists+nouveau@lfdr.de>; Wed, 10 Dec 2025 06:01:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC81310E65D;
	Wed, 10 Dec 2025 05:01:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="hs7siBor";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9BD10E65D
 for <nouveau@lists.freedesktop.org>; Wed, 10 Dec 2025 05:01:36 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-647a3bca834so8270456a12.2
 for <nouveau@lists.freedesktop.org>; Tue, 09 Dec 2025 21:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1765342895;
 x=1765947695; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WXxD719dy2hjGMO3wbw17ffA0XyC2Fpi8GIIpwbBhBM=;
 b=hs7siBortN8yk7Ytg/TQeFg/u9dsBt/2+A76QBkSof4IDbFZjd1hhu3BLwgsBj9xpa
 dXkyVZD1mQpn/7NY3NpWUEQzI4BoxrHRnSeiZBMa/NKqYPWigbHczTNW6sHJwO6+QyKH
 rkRt/gjJWpAMoMhJDvK3DKKNo9rJptJl3hY9/A39RO7wuQvL0hnfEf3iP3by+G75rs6M
 VcuDX4EKKwdlpQwqkS14pLAaw7Z9ZA8RUOmmR+7iiTynSOFZC59mMfr2W/1EePajAU4y
 RnSXHzXwLQ4NlYOYCRdqyKAnFJmidStaCVaSUjRwHc/gYjnKyUHdqXBIzTx/SYQ/NukJ
 XMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765342895; x=1765947695;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WXxD719dy2hjGMO3wbw17ffA0XyC2Fpi8GIIpwbBhBM=;
 b=FP7EqR8XkUEgIBcY8pwju8CZ6Zwyh9ckJTxUu+Reg5G7HNapzTMBfP/Fxqs9GjtUZn
 WoBhcu3rwUpCxBb21E4xd6P58PVRAnUgJgEzPNEtZrzcGLDh8d00pD7FogVLcuiE+ISf
 K/He9Vak9e6AZBYdiKzFLuqEHXZLsjALtgF/bZ1apnG2p2b2nkCCJiK5T1KV7seAOU1c
 uj3m3imV81uu4BFORB8g/q2zqdGpX4AeuODEhl782Xd9RrLR1nyztU3Pe1GkQBPIapRl
 xYSxcSdjXfo2balzZJ/qeX+Juc8cd4qU9IHLFsjdCrYsS8XjOVSq3FmDH5oMfBe1qd6r
 jQPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLwagwIJpnpKCCrbL/nNPfwgOcYeWjAp+QRes9ifjhCcOF/02T5EYyfaspojP5jWzWNJN6L8dY@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFMD3Ykrm77i5Tsfc6qzO2oHK5GawyrnaAs7lByk3u6ih8REc0
 RlQk8QFYv7Inxsr8Cc1/TfWhSivinRGWDs+DjjhzXQ8Lf2SLi4RTGcXFfGkrvMYogjwiPc5/vXF
 DIO50KYkde7dNeA47lz8XcJ75JTZt7Mi5KrUv2Y9NMQ==
X-Gm-Gg: AY/fxX7au++6JGGVq4TUTkqk6zNOyfznXnEk07mh2bprLZ5vlaWOUmszh4Wg9zxkBzj
 2UGq2Vdky3IycYVSOJdA0uiSwac53PgxeE2gWHfC7ox2j4FiK++T28xf6imu7YiMPWBbTsLC16e
 mpbSbqCSyoph6vrIG0Cq+qAIcTTQF+Xyxdl89IamGCeWsEZ6VzkVZSZ3qGx84eQoy9KxZKV9W5X
 tDjOl/oAFIilaxdqfH93k0ZmVK+gaXhK4qlLhy56A9bTqaUwf7qtleSW5wORl+Q/3m0Wj4oBbL4
 rK/DiQ==
X-Google-Smtp-Source: AGHT+IEonKudisdXsoUX6nwqgYRT7I8OYV2s5URNsD7bwkXAsmrKaErN0y2xgAY1HKoxTGOxIyLbu4hZobhy/CLJrZw=
X-Received: by 2002:a05:6402:350c:b0:641:4b82:10c9 with SMTP id
 4fb4d7f45d1cf-6496d5d0fcfmr1132873a12.27.1765342894506; Tue, 09 Dec 2025
 21:01:34 -0800 (PST)
MIME-Version: 1.0
References: <20251205213156.2847867-1-lyude@redhat.com>
 <CAPM=9txpeYNrGEd=KbHe0mLbrG+vucwdQYRMfmcXcXwWoeCkWA@mail.gmail.com>
In-Reply-To: <CAPM=9txpeYNrGEd=KbHe0mLbrG+vucwdQYRMfmcXcXwWoeCkWA@mail.gmail.com>
From: M Henning <mhenning@darkrefraction.com>
Date: Wed, 10 Dec 2025 00:01:08 -0500
X-Gm-Features: AQt7F2qfGPcnwhJI4UUlXnZS397JFiGDANTdLTmA6Amc3DZHfva7fmE76SbOb6Q
Message-ID: <CAAgWFh1DDq4BdGUTR7RGpWZzi3ky0GoAoof7Z21XA6uVNNWvfw@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/dispnv50: Don't call
 drm_atomic_get_crtc_state() in prepare_fb
To: Dave Airlie <airlied@gmail.com>
Cc: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 nouveau@lists.freedesktop.org, Faith Ekstrand <faith.ekstrand@collabora.com>, 
 Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Ben Skeggs <bskeggs@nvidia.com>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, James Jones <jajones@nvidia.com>
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

On Tue, Dec 9, 2025 at 7:40=E2=80=AFPM Dave Airlie <airlied@gmail.com> wrot=
e:
> get_new_crtc_state only returns NULL not an error.

In case anyone other than me gets a sense of d=C3=A9j=C3=A0 vu while readin=
g
this: https://lists.freedesktop.org/archives/nouveau/2025-December/050813.h=
tml
