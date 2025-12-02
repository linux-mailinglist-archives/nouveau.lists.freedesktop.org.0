Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFCDCBAEE9
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:46:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C19810EBF6;
	Sat, 13 Dec 2025 12:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=suse.com header.i=@suse.com header.b="Bf+0VuHU";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D3B10E648
 for <nouveau@lists.freedesktop.org>; Tue,  2 Dec 2025 13:20:18 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5957ac0efc2so6101661e87.1
 for <nouveau@lists.freedesktop.org>; Tue, 02 Dec 2025 05:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1764681617; x=1765286417; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TPGuSfQN7RTqxMcHEP4Qt8V7/gXbXz1mQU1AIOr21Hg=;
 b=Bf+0VuHUm1SsgC5LaZTFJ/uuGr/IQ46qsp9oC2SRRi0JDfKP+mx0KAS77f8vm7OWyz
 3EPASh/JAq18vJGknL9+8G3j7oEMZNUT0OBsHNwab2+zz7MN/UVi2d+b/FELjkKu56mj
 FLY2DrQOyhrI6fGH8qIRFnRzqvANFHbOMy+VTnyNk1H9YxyyGltP7D8bUIS5Yl/gwucb
 qEKjfBWXd5lakdtnZBEGTVq/FBIHyh0oQI6Np4mSjm29NprtWiq64tsxKAAg2VYek0nJ
 y3P/zWm9RzX/4E8DT5BOZ6Pgm8io4jq0Zm1Dyd0sbIURstCM7J0AUJ/Dmfj0TzL06rk3
 ZRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764681617; x=1765286417;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TPGuSfQN7RTqxMcHEP4Qt8V7/gXbXz1mQU1AIOr21Hg=;
 b=P1RsO2HxXFiTU2FT8OBbpqRQNY9VtWX8obVvfo/uXerpPGTw0hmCCrJWARFqeD1G0x
 va69xgt28rRUXSaylPzd0myRsS6ynuM0sWaaCLTGT0BH1G1WPAObxJIFtEhQWlX2CaCJ
 1+rGpLBBTFB9hyMl0sDEMhvgqMkDFMV24kMSrREgJp+SqcEn+1gNOTXuZOzqUFgmh+H5
 kqsEo6GzmYRQhBt5co8OsaZOri3gCNDj+rcwL/AEo/eRL9Nz5qU9nDiGDS7GkTX6M37u
 sORkJlB6gitw/y6VnBAjN3BG6Pc1a5SaVbZUT0Q3s6FQ3j+nvNl1+9CAhszUnrTSZKez
 xxRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSPxOjPtw9KYblZKcd+p93PsyfEJSUi9La6Au/j3sF9YlDuLeTItK/KtERciQ7wMm/tpUOBjpN@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhG93ahJ7dvm7qN37xRlrP8Gv3BGoPfVNowoDxqvxl8lZyoajp
 IIp2rdBsc1co9Qfki9Sl/j3OTQ3f2D5AeUC2VY3Vb6tQTuR1z5S21zvWrt82rxSHGDV3J4+TuBS
 9TBEHlb7FUgqG6aDcIGBcDOcr5H1bKuHYSOogil1Pmw==
X-Gm-Gg: ASbGncvwzlnlarpP3lLFw3WiGGrmhkQqbCMyDLL6gMOsMiU94oC8REw6HZLXM7VaDRn
 /gRcZ46REPMeiP5avVObJGs84aUspSlrrPIlL2PWpram6viXHJJFXDaq3/zVIRJDdtZaYn/Iw8e
 FJr6TLZp5u5hijx4Pu+fZU9Gzq+9FioJhtB9+z2cLhg3e7Qmkd8IJbUYrcxiLcZsIGLJN8UlW6D
 CO+p9CUCpXQz3zPVaD6iOVSOejceZEsyuITRhvxpxr/4HWptInPV8EnvNidshRGSv+jSlX08m9I
 flN4QD7WJFsyP45udHJ9GyBf+KSu
X-Google-Smtp-Source: AGHT+IEA/K/HX/OW8V69s6PQ6GCdzTTi+Af2CoTxJJkGo90jaG61+aENobjT2as2NwixFWEwChx0gWllkjQBUmhw5ZE=
X-Received: by 2002:a05:6512:3e1a:b0:595:7f2b:4862 with SMTP id
 2adb3069b0e04-596a3ee5ccdmr15007743e87.44.1764681616654; Tue, 02 Dec 2025
 05:20:16 -0800 (PST)
MIME-Version: 1.0
References: <20251031102020.95349-1-marco.crivellari@suse.com>
In-Reply-To: <20251031102020.95349-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 2 Dec 2025 14:20:05 +0100
X-Gm-Features: AWmQ_bmpt1iuUsFhYhQyqfygAi5Z2DrfW220D4MyKs9tGqKURWEt-kIZ5YrRuoE
Message-ID: <CAAofZF6M+87thr7KGyytcM1sqebH=U10nSNo-gmuDxeFSrkwCw@mail.gmail.com>
Subject: Re: [PATCH 0/2] replaced old wq name,
 added WQ_PERCPU to alloc_workqueue
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:49 +0000
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

Hi,

On Fri, Oct 31, 2025 at 11:20=E2=80=AFAM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> Marco Crivellari (2):
>   drm/nouveau: replace use of system_unbound_wq with system_dfl_wq
>   drm/nouveau: WQ_PERCPU added to alloc_workqueue users
>
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 2 +-
>  drivers/gpu/drm/nouveau/nouveau_drm.c   | 2 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c | 3 ++-
>  3 files changed, 4 insertions(+), 3 deletions(-)

Gentle ping.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer, Technology & Product
