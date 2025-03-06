Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AFCA5576B
	for <lists+nouveau@lfdr.de>; Thu,  6 Mar 2025 21:26:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9501410E071;
	Thu,  6 Mar 2025 20:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lwoZSY9e";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B5410E071
 for <nouveau@lists.freedesktop.org>; Thu,  6 Mar 2025 20:26:26 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-abf5f4e82caso218841066b.1
 for <nouveau@lists.freedesktop.org>; Thu, 06 Mar 2025 12:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741292784; x=1741897584; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=xghunCJ5jM0/lE8J4zTsXi/eqM1cHpsuQNUqo0iEvR4=;
 b=lwoZSY9egL0q2rYS/C/nAQ1CqwcKL3MP5i9YS1Z9eVZujBgbyya2AsCh/QRszNHl2v
 EFssakwW2EowOBs3Qo0/rMR9zkzMS/iAO751pRpPOTzCiSDWbSUaorc1/Y337D11ZP1Q
 jLAcOaMb2BU6LbtSZ6ae8C8ZvFpcRPG3lPah42iQjb2qKObzjbOhy2JrxllNCujH8GRR
 7XDsDKbidRED2+UolYno6RkkpN4HTB+Ox89ieMF551O3eyMbhkCetmK8vZoh6Py0hq08
 IQTZ7QgAwPTGL2oN3tgFFq9g1E3uH44bi3y72B/Ks3WhH3HNxTcfqbyr+PkceC73FjjN
 EIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741292784; x=1741897584;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xghunCJ5jM0/lE8J4zTsXi/eqM1cHpsuQNUqo0iEvR4=;
 b=klw581pbIcxKyictGZXhcKirR2/GsbAGBdMI9+iISK+BnpETZ6+IgOKl+3oHn8cr7x
 kDvIS1wraiG73DaCDcZnGzhfB0KRNuh2SXugkT0emTm/nU/E5t/G1S6w2A40k3Fhzflb
 1u5yUJXXNrxP9r68+caTSdV6mlKxryJl58bVOmbrWgF62Rt2CGc8qmb1FY023VB+DmRf
 fPqJcZQlvefMpJcS5yjZkNlsI9s9OoUPEV52OUzhOSpau+xHqpKDef2pDiCZj/Gnv3wI
 MWq1AD9Ff3Hc7+96uSqcVpdgmbbg9AnBvm6Vdp7uWNeJSjWvhTcfdvF8auLc2kT51xMK
 kc0A==
X-Gm-Message-State: AOJu0Ywd4sCUlzmdlulwbv4vAFzQzwJy0HX878cWvLdIHmXp2yo8TY9Y
 EO0rq7wnYfgPAobFWCrLt6fqSsWA1Bg49pSGtcSi+X84JleGVjipyvDkKiFfi91SdLCi+9zENQs
 Yo4ReLqIq/KQe0pLr6C3X3AawiWespA==
X-Gm-Gg: ASbGncswO6krA0RBr2LO4qmZDEHNCux994DeYOowLSWwbL1HAXwaQNEzDFwU5Y4oFUX
 b0rhqoI6vbPtAUwyj8leKzi53eTzWKxTXUYQ+E1N1jx7F1a5imYFl7cZoaEL3m9kt0uks4AzZbp
 TYf1hfOvlwtggG/74InkF+pMTu1Q==
X-Google-Smtp-Source: AGHT+IHvXmh25kBPCkcEjnRs5etNx5Cfa94kyZzu0Ipjotu9y/08zBD41IzynvBwnCP4YhBFXsXuV9o+JDHBCSGjy6w=
X-Received: by 2002:a17:906:dc8e:b0:abf:6ec7:65e9 with SMTP id
 a640c23a62f3a-ac252f8f556mr50179166b.43.1741292784096; Thu, 06 Mar 2025
 12:26:24 -0800 (PST)
MIME-Version: 1.0
From: Simon Fairweather <simon.n.fairweather@gmail.com>
Date: Thu, 6 Mar 2025 20:26:10 +0000
X-Gm-Features: AQ5f1Jrkp-q87OeWrmj0MNRj8uJtZgG-RomSCzlmD40-GV1j7yaidDGO813cVyU
Message-ID: <CA+9vR5E==aQehSpeFa5fa279ZnC68WOSjnJ6Ycp8N-yg_BBinw@mail.gmail.com>
Subject: GPU Metrics
To: nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000d89eb0062fb25187"
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

--000000000000d89eb0062fb25187
Content-Type: text/plain; charset="UTF-8"

Is it possible to get stats via the driver similar to -smi and other top
tools.

I have found Temps/Fan via hwmon and clients using. Looking to find source
encoder decoder mem Freq

I am looking to add support to a GPU stat plugin as I have added virgl
functions currently using nouveau but would like to show stats of usage.

--000000000000d89eb0062fb25187
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Is it possible to get stats via the driver similar to -sm=
i and other top tools.<div dir=3D"auto"><br></div><div dir=3D"auto">I have =
found Temps/Fan via hwmon and clients using. Looking to find source encoder=
 decoder mem Freq=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
I am looking to add support to a GPU stat plugin as I have added virgl func=
tions currently using nouveau but would like to show stats of usage.</div><=
div dir=3D"auto"><br></div><div dir=3D"auto"><br></div></div>

--000000000000d89eb0062fb25187--
