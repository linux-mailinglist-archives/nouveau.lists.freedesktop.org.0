Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3606B21788
	for <lists+nouveau@lfdr.de>; Mon, 11 Aug 2025 23:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C6F10E54E;
	Mon, 11 Aug 2025 21:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="0ge01JLY";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D53210E31A
 for <nouveau@lists.freedesktop.org>; Mon, 11 Aug 2025 21:39:00 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-70744318bb3so41990036d6.3
 for <nouveau@lists.freedesktop.org>; Mon, 11 Aug 2025 14:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1754948339;
 x=1755553139; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/lUkAmcsFJuKtRa8jpai2ZZYWb/fYbdKwA84kAMpapI=;
 b=0ge01JLYe81ur3eC5I/G4HFR04uRna9QNtP1D81os+e/igQVgR1KTPPbTzJUEQARb/
 0EjjZRkwfbdthtOFa5YnuAUI5s32gIwFCUSvYozG/7jqRLLQz+VRO63AwBhTd0nVA0A8
 3ZaAF/DvsYN7ay7AozRxrF4v7KOUaDChKajFA8dZhM2x1KDRvF7lUxZwDN0joJFa115T
 LzZga8KOkd7MgCcFqydqe/ErmzLKx9P5Cna0oztln41or6kFHEL/V8uaNjpvvd8IVair
 x5XoZn7s6/ClYbAuDIcuvrwqbDIePT0DjF3XKm7BKvljTH6fhKnyj6veWdnXNdZzs/i0
 pAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754948339; x=1755553139;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/lUkAmcsFJuKtRa8jpai2ZZYWb/fYbdKwA84kAMpapI=;
 b=P+pIOJ/NqlpOURLcWK+arMp0Jlw/ysIdBoLFF/fREC5A2Hh+3ZV6u104SCyqmPIkvP
 n4YNury5J0gzVQ+yYU3WQ7+L6fHRQdwusSIrEUXQoueeFeWCG4JT4+3G2jBpCJ8IFTE1
 MsBdoE++hgX+PHYvewjaKDs8tSoRQMnAw0PufOScK1zDBLZZrruhaGdH0nSXP3zA/ovv
 m5TV1THxfYZ9Mh3l1HTYwAPvZbTGHe67bnXOx9lBRoGB1DSpmvCh02tUgQn3l7tlQNcF
 wv61bwaHKXbwERzc5Vaff+yD20P0dQaeYodl2W0gnMZzO13JKqMdNrcstkCP4c7Egj4J
 B6aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeTGXLlDy4iAT+ATJ1INEsTqlo/sAFUdpUDH/EZ9fqFwFWjYUSuZfAE6xxgq+S17Wb1eZlLkOi@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQ73AMcKZG0V6QkwV/Tm+rzGhHh0UiW7GQcMZia8+XjJ+ORnuX
 bmBls0XjzyFgOwqtIQqh99/qWAGmF7x2on1z8O+QYjDLH2poTREWsrX0fHNOjdiot/M=
X-Gm-Gg: ASbGncvlnixUEFHujC2/LR7NWKX1XKMEDFWjktouS7p6qGZV3Ls0P3DPrFjAVZyACkA
 1oSZXzFsFBYEvlWjnTF3FfybF9bFA3Cc+QuGeekNCOBg02FE9ObEb//LNxirPMWw8OSeIyCU8Uq
 HDCmQIfZ0NDNPyPbGms9jruSckap11oQOB1ZolHTiapl2iIAA/qbPwb/dUPdaeqSdjGrVQLSOrr
 2pVAoHx1ZWze/4q/SoHqEEboKTrCRWRDmY8Ze7+8G/OEPXY8YHxwWJck4tpuKxDswhDDVEs0wND
 uE6sMC5nAoNtVggnELBeymcDqSPvTJzx0bZkHEvZtXNKN718YX6Uzksqq0PUVbdfyWtIzQieZE6
 tX08R4pfmLZJKGhctluVaCH1TNCQ5Nbk4nv563a7aSMY2UiuHnpwjIlaIaJ6UPMZ7KGh0xmZfuQ
 s6cHBF6intsbMi7JI=
X-Google-Smtp-Source: AGHT+IFx3WwAo4wc6OCIN5rnA0B2oh9bKzz63paRZX4SRApohfirp7X3wj4EXnZDsoVIIcqhXp8FtQ==
X-Received: by 2002:a05:6214:224e:b0:707:4023:6b8f with SMTP id
 6a1803df08f44-7099a33243cmr193134136d6.28.1754948339172; 
 Mon, 11 Aug 2025 14:38:59 -0700 (PDT)
Received: from m-kiwi.verizon.net
 (pool-108-18-253-193.washdc.fios.verizon.net. [108.18.253.193])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7077ca1d5ecsm163097136d6.26.2025.08.11.14.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 14:38:58 -0700 (PDT)
From: Mel Henning <mhenning@darkrefraction.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, ttabi@nvidia.com,
 bskeggs@nvidia.com, martin.peres@free.fr, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Mel Henning <mhenning@darkrefraction.com>
Subject: [PATCH V2 RESEND 0/3] drm/nouveau: Remove DRM_NOUVEAU_GSP_DEFAULT
 config
Date: Mon, 11 Aug 2025 17:32:30 -0400
Message-ID: <20250811213843.4294-1-mhenning@darkrefraction.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Following earlier discussion at
https://lists.freedesktop.org/archives/nouveau/2025-June/047887.html
this series removes DRM_NOUVEAU_GSP_DEFAULT.

The first two patches are the same as they were in V1. V2 adds a third
commit that improves an error message in response to feedback from V1.

Mel Henning (3):
  drm/nouveau: Remove DRM_NOUVEAU_GSP_DEFAULT config
  drm/nouveau: Remove nvkm_gsp_fwif.enable
  drm/nouveau: Improve message for missing firmware

 drivers/gpu/drm/nouveau/Kconfig                 | 8 --------
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c | 4 ++--
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c  | 4 +++-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb100.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb202.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h  | 1 -
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c | 6 +-----
 8 files changed, 9 insertions(+), 20 deletions(-)

-- 
2.50.1

