Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9ABCBAE12
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:45:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D26910EBCC;
	Sat, 13 Dec 2025 12:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="eqEem7dA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E36710EB99
 for <nouveau@lists.freedesktop.org>; Thu, 11 Sep 2025 21:58:26 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-55f753ec672so1387042e87.2
 for <nouveau@lists.freedesktop.org>; Thu, 11 Sep 2025 14:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757627904; x=1758232704; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0W0ugld9idsCY1TcFykNGEpN8ggbtVo9qqVnDRaPVfw=;
 b=eqEem7dA5mfY+xf7AtmB9nfFd0h0AMlBQydpWxHSs7YKl6DVGf9G+81bfJSudpTtxT
 Xbi4XcpJixfVhNu5+5CrQTCKdni2xU5MWyPiKrKifMMtQgHdr9O/522tSiNnVVMiXPg+
 Mdt6YVuPgnKtosBKgOxAGc8PljohSecvlZIG5HY63v/OY6nYt9EDzKc+TxwVLzxTsp29
 E2UmJvQnnC7U2FlPxA/QSZndYY5WMMOKlw9TB3kGbwHvOo9jGsU7Ie2y7YsJjO9+85NS
 ShHHNs57mircnlaj+jW+So+9pd/Z7GO1n8TI7Yj8oIi7uecZon0oOY3Axnxa+Q7NFn9W
 FQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757627904; x=1758232704;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0W0ugld9idsCY1TcFykNGEpN8ggbtVo9qqVnDRaPVfw=;
 b=nclC4SnrKTb4gXn0zFavR2vhEMKx/QJBjbYoNErgAkJt2y1MWvJutEy/ZHirQqr8YK
 /6CcPx8Ig+FUXAL4imrioL9IYeQ3MykbmYGMJ0fN4mEqq/OlJ+9XpACDxbB13CYeX1qF
 9C+yUrgPjHpqrFkByHzN8+hTlQzf+46+UXfFMYIWVMXLko+FfQOHuhClq5cCzIPUuaCi
 Duw91X/hRla65OkmtNSKffnrUEwwh6w1EYc8AlVoqttG7fLUIwzgUfRWuvTWzpcspdAf
 ScupEvl00+XrY2JDJ6hlXHvjGIECba/5UPLRJEGwMPycj7B9ydp1xEIktAj5NEpoJ8nV
 WNLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuY+VxpbFUOwk/mvP3uRKI5YtOoed17NTBNJ5yjKPmsznXIg9eJHwu5cj01ZDXEvTQ/sz0b1Hd@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3ybKCvHXJN2OsOoSE1U0Od4OxQ/GHS+e87dpgqddKuBOj0+BO
 pokbCXA3G9cjMaWi3gBX2v4Puu6IUSefwRuruSV8UG/40eYbDv8WaOxnXxR7zdoMS/+n2MT1cRC
 BCYE+icfs4tfaGo0gAdn8/n8gjYzDh/w=
X-Gm-Gg: ASbGncv4F2JyLARDrdaeBp5AbhKVQ9qFpQS0W4wqXRvPncvxCMd1gD3vnexX5pzrhlw
 dsz7HBIcF+PGtFJLrBKY5dvwCNHtr4CZr9tOlarFxRzKYavOMEYretxEKztTLl+Gpy4RWQQ0Vgs
 flSfHuzDQlJ/QaGh6qJlHztKqYTiERBfV3GcMPNwWG2pNi6gTH3oHfAyCuT2R0liTmkgaHNd4in
 ZbyqR0=
X-Google-Smtp-Source: AGHT+IHQTRZCuL6gZAI5xA3kq+cJ/rdq4B7A7fP2ET2XUXeBi2OlT5Hdl3FKWnoKQmRyk/20azMJBe31VteTWRfnTLs=
X-Received: by 2002:a05:6512:63d1:10b0:56b:92a1:387 with SMTP id
 2adb3069b0e04-5704a105ea5mr326155e87.7.1757627903918; Thu, 11 Sep 2025
 14:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250906-gk20a-devfreq-v2-1-0217f53ee355@gmail.com>
 <eff194a2bc0bf5f59d6fb92ea5913e2343589178.camel@redhat.com>
 <4777352446cb5fed094246db526f3d6f09729736.camel@redhat.com>
In-Reply-To: <4777352446cb5fed094246db526f3d6f09729736.camel@redhat.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 11 Sep 2025 16:58:12 -0500
X-Gm-Features: Ac12FXz5J-DcG25Sbjvg1ZaCJ8cUj3WY-nLpRDh4VK8xggBzNXlBd14W6PGpg_A
Message-ID: <CALHNRZ8UWL4FX_pQ4AsoHOVyUU7N3FAkd-DBS7vqfjpPjKd-_w@mail.gmail.com>
Subject: Re: (Can't push your patch :( ) Re: [PATCH v2] drm/nouveau: Support
 devfreq for Tegra
To: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:44 +0000
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

On Thu, Sep 11, 2025 at 4:49=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrote=
:
>
> =E2=80=A6Wait - sorry! I should have waited until actually trying to appl=
y the patch
> to drm-misc-next, it seems like something is wrong with the way that you
> formatted it?

It depends on the gp10b reclock patch, as stated in the b4 metadata:

> > > prerequisite-change-id: 20250822-gp10b-reclock-77bf36005a86:v2
> > > prerequisite-patch-id: c4a76f247e85ffbcb8b7e1c4736764796754c3b4

Aaron
