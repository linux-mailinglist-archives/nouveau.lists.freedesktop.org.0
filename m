Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A0E8AB178
	for <lists+nouveau@lfdr.de>; Fri, 19 Apr 2024 17:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B615710E705;
	Fri, 19 Apr 2024 15:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DwV5p8r7";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B0B112DF4
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 19:11:08 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-56c5d05128dso5231593a12.0
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 12:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713294666; x=1713899466; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=isr0Tdh2CeFHFU8imkduOqhf1EW/yO2SSOmOTFLSanI=;
 b=DwV5p8r7PnXlQ4A4jU1MLOvMpuhymW5EHnJuKU6l0ipvjV6RZDCFRL801IPwwWCE/b
 Rz8yDVfOE0+9JCcUXnMsESSJu+qs01zKnxCX7oL4rplSMUM29K2u+c84MH8KWkfsd/OV
 F7JZPJkU1Sc2TNLNFshEH5W5nj6IukMmoiFGcWXzAGyJkhiFtsGm5CtHhBXwG1Uo+kQw
 R3xDzfcq/Hj6wbbzMd90wYa7CpGhiDpmrULvt5YdIimfQn1s18fFvxcgsRqer0nPrU/l
 QyDO+sj5BLMmOwtGa5bMW+/n4YRuVTfA9dT35zmyfbjq4eePwn3EChpmGOuVTSYt72kg
 vWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713294666; x=1713899466;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=isr0Tdh2CeFHFU8imkduOqhf1EW/yO2SSOmOTFLSanI=;
 b=nhWrDjYQngstIZuRqiJ4RhoIdkwOdB/okhyNw62/m73rHbuhdEqY75x/GrB5B1D/+d
 el/dZNe8nmOb8mJ0JLk1Au71b262PpsJa/zYqbd42hSHuPxsunr4eyJw6E/g8TYXRZVi
 H8onS2J1WluaXMDWoE6MFTeM7xdjFy+Kk0/ikrvrkeNmP/ZR85laSUDK2W+VUpyqUKFZ
 YubQz1+eZ8BzphaGl+sMYdnryCp64b3saSDBpaC6dnokrXtX5pvTcZ1eGHHLEirVickO
 F1J5EY3+GzNBG0ZGrl/l0800qaPrw1ERgAVYgQ3tatvm7Ir8BfWQ1q1z1R2q64Fq1tAl
 vAKw==
X-Gm-Message-State: AOJu0YyhW/5UMTvKu8xwu9XRmpiI1kvnj9HMtrOCeqYJtdL+d4GM1lJq
 y37wykq0iwP2OndWpSsoG7nbjtU3ZKIkoZRz3aNBVt7HNqFL/wAAQQx83a6JZFr71fptxhw85bF
 OyCSiDznpjSkR5+HJWtWsiO1OVw5ggynfQxo=
X-Google-Smtp-Source: AGHT+IFJ3eQ8J1SKwzeqcF85ppSQa3atRleY54kqbtConog3cpSSQtH18kDr4t2BI4iBBa5eZ+DXj9bGbErvzNlazdM=
X-Received: by 2002:a50:ab59:0:b0:56e:6e0:9f39 with SMTP id
 t25-20020a50ab59000000b0056e06e09f39mr9694826edc.17.1713294666079; Tue, 16
 Apr 2024 12:11:06 -0700 (PDT)
MIME-Version: 1.0
From: Raymond Wong <raymondwong3690@gmail.com>
Date: Tue, 16 Apr 2024 15:10:55 -0400
Message-ID: <CACnaySK2RJV-1k7EsS1fGgsnBA1HE-PrzuPUdFw2JPaEGHEgMA@mail.gmail.com>
Subject: Nouveau on a RISC-V SBC with Tesla K80? Supposed to not work or yes?
To: nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000f7ab1306163b7fe0"
X-Mailman-Approved-At: Fri, 19 Apr 2024 15:14:16 +0000
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

--000000000000f7ab1306163b7fe0
Content-Type: text/plain; charset="UTF-8"

NOUVEAU MESSAGE :*  {*






*[ 47.314360] nouveau 0001:03:00.0: enabling device (0000 -> 0002)[
47.314452] nouveau 0001:03:00.0: unknown chipset (0f22d0a1) [ 47.323897]pci
0001:02:10.0: enabling device (0000 -> 0002) [ 47.323938] nouveau
0001:04:00.0: enabling device (0000 -> 0002)[ 47.324095] nouveau
0001:04:00.0: unknown chipset (0f22d0a1)*
}

CONTEXT : {
This thing belongs to someone else, but I'm playing with it. It is a
VisionFive 2 (a third one). It would seem like the PCIe implementation in
there is missing something that Navi 2s and 3s want. Therefore some Polaris
cards and Kepler cards are probably the best GPUs this SBC can run.
Of course, it is two GPUs on a single PCIe 2.0 x1 lane using a riser. I see
that the Tesla K80 has it's own suspiciously incomplete line in the
CodeNames section. But nouveau reports unknown chipset when attempting to
load drivers onto the GPUs. Maybe it doesn't have the configuration for a
Tesla K80 after all?
However, given Fishwaldo's 5.15.131 kernel is running on the SBC, I wonder
if Tesla K80 support has been added somewhere, But my roommates (myself
included) are combined all just too noob at googling to find it.
}

SYSTEM : {
Board : VisionFive 2
Kernel : 5.15.131 Fishwaldo using pine64-star64_defconfig
Nouveau enabled using scripts/config -m CONFIG_DRM_NOUVEAU
GPU : Tesla K80 dual GPU wanting to use nouveau drivers. One PCIe 2.0 x1
link connects both GPUs.
OS : Slackware ARM RISC-V (Full system, 16GB installed)
Notes : It would appear that a GTX 750 Ti worked on another VisionFive 2,
as did a RX 550 on my Star64.
}

--000000000000f7ab1306163b7fe0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">NOUVEAU MESSAGE :<i>=C2=A0 {</i><div><i>[ 47.314360] nouve=
au 0001:03:00.0: enabling device (0000 -&gt; 0002)<br><br>[ 47.314452] nouv=
eau 0001:03:00.0: unknown chipset (0f22d0a1) [ 47.323897]<br><br>pci 0001:0=
2:10.0: enabling device (0000 -&gt; 0002) [ 47.323938] nouveau 0001:04:00.0=
: enabling device (0000 -&gt; 0002)<br><br>[ 47.324095] nouveau 0001:04:00.=
0: unknown chipset (0f22d0a1)</i><br>}</div><div><br></div><div>CONTEXT : {=
<br><div>This thing belongs to someone else, but I&#39;m playing with it. I=
t is a VisionFive 2 (a third one). It would seem like the PCIe implementati=
on in there is missing something that Navi 2s and 3s want. Therefore some P=
olaris cards and Kepler cards are probably the best GPUs this SBC can run.<=
/div><div>Of course, it is two GPUs on a single PCIe 2.0 x1 lane using a ri=
ser. I see that the Tesla K80 has it&#39;s own suspiciously incomplete line=
 in the CodeNames section. But nouveau reports unknown chipset when attempt=
ing to load drivers onto the GPUs. Maybe it doesn&#39;t have the configurat=
ion for a Tesla K80 after all?</div></div><div>However, given Fishwaldo&#39=
;s 5.15.131 kernel is running on the SBC, I wonder if Tesla K80 support has=
 been added somewhere, But my roommates (myself included) are combined all =
just too noob at googling to find it.</div><div>}</div><div><br></div><div>=
SYSTEM : {</div><div>Board : VisionFive 2</div><div>Kernel : 5.15.131 Fishw=
aldo using pine64-star64_defconfig</div><div>Nouveau enabled using scripts/=
config -m CONFIG_DRM_NOUVEAU</div><div>GPU : Tesla K80 dual GPU wanting to =
use nouveau drivers. One PCIe 2.0 x1 link connects both GPUs.</div><div>OS =
: Slackware ARM RISC-V (Full system, 16GB installed)</div><div>Notes : It w=
ould appear that a GTX 750 Ti worked on another VisionFive 2, as did a RX 5=
50 on my Star64.</div><div>}</div></div>

--000000000000f7ab1306163b7fe0--
