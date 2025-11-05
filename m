Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6A2C3834A
	for <lists+nouveau@lfdr.de>; Wed, 05 Nov 2025 23:33:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED8E610E7B5;
	Wed,  5 Nov 2025 22:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="hsbSO9Gq";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669D110E7B4
 for <nouveau@lists.freedesktop.org>; Wed,  5 Nov 2025 22:33:09 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b7277324204so34180866b.0
 for <nouveau@lists.freedesktop.org>; Wed, 05 Nov 2025 14:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1762381988;
 x=1762986788; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Szr/I/23aXpFKXBJi1aHTQqCJ/stBoKYNXps0uuzFjg=;
 b=hsbSO9Gqx0mm0GWVJTXcWyIUc4OXwCCqjJ4yuN6b/N3pc6vhfkK4ty0PUO13thDnma
 Oe9DgMcVgIkFmdEPeDfcO5aw0ygUYC0kA5GfjDNQ9OqJIjqy6CKlyOg+wecdO0kNYgFx
 QbjMG3zSsLnc2KoSmw5LAJSkjDq7JVNmJ5on3kjLlC9jUzt5cYLkzAExKmcgs+lb9Od9
 R3CzACE13dFSb/AAjlbgq8/kVHOTlCfgJ4bLnlp5dH84NyMWb9r1gsEfVuydCK8RH48Q
 5hWk6Ef3IfUkO4uxzVhU65XJcO+Nu+GqEgItKVPUhyeey2a4aYd6rrOzScM9YM1eAakm
 39uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762381988; x=1762986788;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Szr/I/23aXpFKXBJi1aHTQqCJ/stBoKYNXps0uuzFjg=;
 b=VR2qiTTA7W2Q0/blIgVQ8bRUOa2NA4l5FUZUFd1ihixfR14hcSjs36HfF4Err8cVyg
 u/uj1phdHetgpYjOYgc7pPZ3JEppSK0nx+p3/2epOmBWTXrCKu3zRyUkCHzXMMDTUNtd
 aP5DbzLa2A/Lpc8vd5kTxN+VlM9u5jNet9EXaBqzQTMI4aVxPpSDs6Aw5mONSOVG5/MW
 3pv9YD1YW2Q+rZ2PYGJeRjzeTeL2OL0tBEIqc8GG4aq8POdWDjXSWeCVyTDS4CjQuhLI
 jmgKmxQthkADJc5BwuHzJE8HQDvypTw4AFCZfnnOtyUPfmTeGpQsci8O3J7FGHuzNe2c
 Nucw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwOjOMYLBDQ+0Fbf78KyJPB44TyEo2w543esheZWPzRPCjSHsrZfZKVO220gIqhjHpOHdRjQz+@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztnQyTkIwhdS+oVvyxEyFz9fc6P3RK677DHdSgbxGtLZAlFGbJ
 Q9XNBR1jofbAsxNW1zSwwFqLp4mKb6rNeZGJjonLgQ07ZePodZnGDqPKj5qrDbYTuDQ+O8RjZ/G
 SeFrburGB8S1+cK2stGHGTWOZUkLS0DyZ3N5P6O30Xg==
X-Gm-Gg: ASbGncsZYvHzEqADX6ByBlGPQb3NYwCDseCewzi6/gnCsDiICRxLOR3pdc9wkaZyK3U
 wtnTeptUUz0gdiuRfJw14ZaPxrG6w34MKoPyTmvZ/AqEFz813Fa9wSbAd4ZHnTfmYv2n9nCOLLG
 jBtAYwtPZsoVCcwRJM8C6P/ae3zoRak0CfC9PhUghAg+ifONAfSi3dYt2sDEWycjlBlldg0V2Jx
 OXzHoNQRSZz623mhLqSLACcwWtU/bDRvRlyJuaay4TRpDO6xa7AzveazZbX
X-Google-Smtp-Source: AGHT+IECc9Tb6PQXUfyG8UVINPUv+8WuWF7S35bpfNhdSjAQ8wS3WKzirND4FdWE3HzVjloMGajR3KJsnvuwrExox2k=
X-Received: by 2002:a17:906:4fd1:b0:b6d:7859:61eb with SMTP id
 a640c23a62f3a-b72653ec85cmr441833366b.29.1762381987591; Wed, 05 Nov 2025
 14:33:07 -0800 (PST)
MIME-Version: 1.0
References: <20251030230357.45070-1-mohamedahmedegypt2001@gmail.com>
 <20251030230357.45070-3-mohamedahmedegypt2001@gmail.com>
 <209ea5680e5ca28b6d068ef8e0b58613c93bf525.camel@redhat.com>
In-Reply-To: <209ea5680e5ca28b6d068ef8e0b58613c93bf525.camel@redhat.com>
From: M Henning <mhenning@darkrefraction.com>
Date: Wed, 5 Nov 2025 17:32:40 -0500
X-Gm-Features: AWmQ_blkOGBCCpLWGWm7AJHNww7fhuXYw2d5ogzt_C2ETFcndeIo2dccLJU1Ags
Message-ID: <CAAgWFh2Zy=9vt6x4e3P6G+_RV0Hu66jyJjpKWWx4WVg8EAV+Ng@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] drm/nouveau/uvmm: Allow larger pages
To: Lyude Paul <lyude@redhat.com>
Cc: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Mary Guillemard <mary@mary.zone>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, 
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

On Wed, Nov 5, 2025 at 4:01=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrote:
>
> As long as you fix the parenthesis issue in the next respin of this serie=
s:
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>

There's already a v4 on the list that fixes the parenthesis.

Anyway, if I'm keeping track of things correctly this series is now
fully reviewed (v4 on the kernel side by Lyude and James, and on the
userspace side by me) which means I think we're ready to start
landing.
