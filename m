Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0650CACA03A
	for <lists+nouveau@lfdr.de>; Sun,  1 Jun 2025 21:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1709B10E049;
	Sun,  1 Jun 2025 19:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=alum.mit.edu header.i=@alum.mit.edu header.b="h2PHaMan";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2046.outbound.protection.outlook.com [40.107.237.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F8810E049
 for <nouveau@lists.freedesktop.org>; Sun,  1 Jun 2025 19:19:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gS6gwbnuJRL9mqKjF5DAGcOg1S5m9Qo06L0/HCXJd1OtcP7icRsdApP5BbeA5nT+aod8mcKbcXoRMYyOZ2QOwItg3YGH9UDi7anu8EGiWUDAnAuggHcniDeBdrZcaEMkZpGXCCy2nKodn/S7WcNQb2/V0m6EgvamOnrj11D34NdAsjhk70zHCImBoU88jZshhuDX5pfx0+V/6pJnkf5HgjHVCr4AiE0yWFpBQ0HS6f6gHWlxOCoZEob/fScTxLN5X+1KbDdM8gvhuT/w/ErfeQ3g76RwFdUVu4Bo6+X4b/mY/p4L3pOE1l02TG+PJFIsTlY8zY5Z6fCjBC3W+wHUJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QiZpskrfyBIBf984U8dEZnNXHJeaJHUKsXuA09GOnZk=;
 b=sI228jjNqcATAHCDP/YA4tOM4B4LVu5OXzh3ygwxvsc9X4pmArXZ7rw0C+zQ1/P5z47P6RKwj/7+SLNcqf3wua/+0NtZhK2nm4XXGiPf/VQQk+1UvAlRknZ+MGr+KLV6V4gC3nwKSKuAq7lx7JRj3TjUIDNOLQQtOUiT7dc3MAk4vNHMzBE2yJkIGhdwrQXTr1kY45z5QJJPokqNBw9SP+an5HnxDbsTdz+c1MwHlXvlnj8GeHfbCwnMu9nO2VRFzhj/ELQrn0IPvdD2Z10J8PNRmwYnhz/sgWHqka+XHsfTHU1+agY6DioD0l5509hBtq5pD8GSo+RhjcMnb3ruLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 18.7.68.33) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=alum.mit.edu; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=alum.mit.edu; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alum.mit.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QiZpskrfyBIBf984U8dEZnNXHJeaJHUKsXuA09GOnZk=;
 b=h2PHaManBLp1SCNYghLN3xznBNHGmOHzj2TNzsUexURXt/I075BUxMpjWqpZ+cUsPs3/de3XruAsw8yct2Y6ebZ77Eg/9ssqOnZc5o+8+fRJDze598eSOH1pIKg4aVT6SBvX8tRXCQAdD3Z82t4l+fp+0YUTo1hi3VBjMRNOfWc=
Received: from SJ0PR13CA0025.namprd13.prod.outlook.com (2603:10b6:a03:2c0::30)
 by BL1PR12MB5708.namprd12.prod.outlook.com (2603:10b6:208:387::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Sun, 1 Jun
 2025 19:19:31 +0000
Received: from SJ5PEPF000001F2.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::3b) by SJ0PR13CA0025.outlook.office365.com
 (2603:10b6:a03:2c0::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Sun,
 1 Jun 2025 19:19:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 18.7.68.33)
 smtp.mailfrom=alum.mit.edu; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=alum.mit.edu;
Received-SPF: Pass (protection.outlook.com: domain of alum.mit.edu designates
 18.7.68.33 as permitted sender) receiver=protection.outlook.com; 
 client-ip=18.7.68.33; helo=outgoing-alum.mit.edu; pr=C
Received: from outgoing-alum.mit.edu (18.7.68.33) by
 SJ5PEPF000001F2.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.29 via Frontend Transport; Sun, 1 Jun 2025 19:19:30 +0000
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47]) (authenticated bits=0)
 (User authenticated as imirkin@ALUM.MIT.EDU)
 by outgoing-alum.mit.edu (8.14.7/8.12.4) with ESMTP id 551JJRwO029918
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
 for <nouveau@lists.freedesktop.org>; Sun, 1 Jun 2025 15:19:29 -0400
Received: by mail-ua1-f47.google.com with SMTP id
 a1e0cc1a2514c-87df8fa1c6aso2067523241.0
 for <nouveau@lists.freedesktop.org>; Sun, 01 Jun 2025 12:19:28 -0700 (PDT)
X-Gm-Message-State: AOJu0YyDW9qKaL4Mm1LduLUVXCe1Gn8ZUroGWoAb4IE4dOU+xAwGTFZB
 /n2mrO7eb/+Hw0lLyf3ZnKlsuFLrzIuqgpv2EM4e4j3b1pxRWKc9SezHsfKQG3Uc1z8wiflDseV
 oPaZC3a2m58kqhAsRr9OkPez+vO7Y36A=
X-Google-Smtp-Source: AGHT+IHoS9PLfBnik0guiD1ga31Uuw6Gf+1zf8hrn40ay81QiCeE+NfqoEqk7iASGUIv2L31mVoiMbt6VYGJkf8mjj0=
X-Received: by 2002:a05:6102:508e:b0:4dd:b86a:dac1 with SMTP id
 ada2fe7eead31-4e6e40d96f2mr9750649137.3.1748805567750; Sun, 01 Jun 2025
 12:19:27 -0700 (PDT)
MIME-Version: 1.0
References: <1818914354.20250530220210@gmail.com>
In-Reply-To: <1818914354.20250530220210@gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Sun, 1 Jun 2025 15:19:16 -0400
X-Gmail-Original-Message-ID: <CAKb7UvgJWmCSSJSgRiAXa2H4XOY_2d94-EmASp37MZjpMO-HFg@mail.gmail.com>
X-Gm-Features: AX0GCFtqRTn9zw7XC3fzURY7t5gUS0MaiJm38vStByz4PCUxXfrKvsa4xg0SQ_g
Message-ID: <CAKb7UvgJWmCSSJSgRiAXa2H4XOY_2d94-EmASp37MZjpMO-HFg@mail.gmail.com>
Subject: Re: nouveau, a few errors in dmesg output
To: G2 <g2subspstlc@gmail.com>
Cc: nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000a5aa920636878697"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F2:EE_|BL1PR12MB5708:EE_
X-MS-Office365-Filtering-Correlation-Id: 80cf7fbf-db6b-4934-4479-08dda1413bfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|43022699015|41320700013|1800799024|82310400026|36860700013|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2pCUDFUTldlcmRNYkNFOE95c2ZVZ2k1bzZTUTAweE1HWUt2QmQ5Yjdzc0pl?=
 =?utf-8?B?ekFvSGZMMG8rUVh1Y1IvbUkxUXZEZkkrM3hQOHJuUzF6ZnV5aXRvVjE3U1BI?=
 =?utf-8?B?NSs2enY5MEhmYlRoQlJYQUtVTUN5T2c2dkI4NFVSdlh0MTgyQ28wUm9RdnVl?=
 =?utf-8?B?dnJKVFd4RVdGK25VZTY2R2VOWENoNWxTckp3UEpZZzVsMnhYRkd3RnJTK29F?=
 =?utf-8?B?T1pMRFZ1V3N0R2ZYd2l0ZWJlMzFKRlI3Snl6ODQySWJabmswKzYwcmMrOHVt?=
 =?utf-8?B?UmxFRDUrbkZiTHA2QjF6eHhDeWo5amo3b2FQWkw2aU1lN2t0RlpqZlJjbTlh?=
 =?utf-8?B?QjBERThYVGQ0NTZOZDM0TXd1eHZrY2tqWTFxeUhVdEdIUk1GSXVEcHgxZUJk?=
 =?utf-8?B?eFJQSXF5TUxNejN0UkpWRVkrQlMwdW9CVlFNbUsvMkdjL3RGbUNveFFQL2k0?=
 =?utf-8?B?c2JPRU5UbTUwQThCbmNPSlVFdE80Y2Zhdmx3MEl1a0F3b2Y2UkJPYzRzc21I?=
 =?utf-8?B?REJkOWFyaXdTQ0x5N3MyZXdiYjRVejQxVTVZMUM0OUg3Nmx4d0JhUE14WmZj?=
 =?utf-8?B?aHhUZG9wdWFqanN6YXBCdGp3N0ZNSG1jSGpkNXdQQzdiQ2duUjJPVENRTXRG?=
 =?utf-8?B?b3llMWZhQ0M3cG52OEIwTzYvWkcxNmFNOFI5bTdVWWw1elhBckdnR3BRUENz?=
 =?utf-8?B?aW5NYWlqVHNIOE5WVHZwTzdFVEpHYTBNYTlPU3lJbzgxdHdYR3kzM3RDeGZj?=
 =?utf-8?B?LzdHY2VyRGNaNTBTRWhiazVKVnFSRVpPZkNyRmxETG5wYkUyTytoc3YyRURn?=
 =?utf-8?B?TXhyQjlLSzJNZkRHcERZNVptWFlGQXlCQ255bFVpMUNiZW5FeXMrdHBXOUxl?=
 =?utf-8?B?YlNZc1hYZWIvSHpuOTZJNlRpaTBrL0F0ZFFoQmE1UWFLQllOanZMSlJNOEVm?=
 =?utf-8?B?S0pHOWtsWFpRaW5EemNRVXRwVFN4bFA3REJialV4UHVVQTRheWVTVWxiNmpB?=
 =?utf-8?B?UTJWUHAzSml6ekQ5TWY4QVJVaE1tY3F6SU5UR2w0SEN2YmJjWDVMWUJJQmsw?=
 =?utf-8?B?UnVZQ1lDbHAyeXAzV0tYTW9ueTA4cVgwZEc1TkhJSGt0QXNWcmhDTEtNaFpB?=
 =?utf-8?B?d2ozR2RMTmIvYkZ5T2xScHpzNldDMlM0QUpONmFEVXU2d2drL24yeHplMDlC?=
 =?utf-8?B?ODBOcUROVEEyYUxKTEV6MHp0UlFONzJYZ1gzcXVXZTE1K09tNG5XejFDS0Rz?=
 =?utf-8?B?SHJsb1dka3krNUNzamw0Y1BjMS9WbG8wM0VJOWg5aW5mWUxFV014cjZrRVMz?=
 =?utf-8?B?VVM2MFNYUVZTYVJSZGppS1ZTVkZpQWtBMVBwTllDNEo2L1ZpRWovTHRPaVU0?=
 =?utf-8?B?eWV4dFRaY0hRditYMngybll3SVp6cFMyeXpzc3FiRjg1QkZEcktNd3MxbnI0?=
 =?utf-8?B?bGNkbjRCbWczcjBBRVlDS3pZMW5RUy9UUjNUYitrUWx5cFFuUGF5ZTJSTmVo?=
 =?utf-8?B?akxZcWpUanByUXlXM3l1ZmtUUGJDQlJnVnFHbDNGQWhQWEFGdmRUUW9NdmJQ?=
 =?utf-8?B?N0FUVDdaOTdxYm1xbjJFSVRNMGtMMWo1TkIwL1IyVjA0cEI1NVVkV2dSRUtB?=
 =?utf-8?B?OXJsa3hGTHZVVEVOUjJBU0RYOFY1cUxJa1Z1VFlweHpTZEZ2NkovcXlyR29Z?=
 =?utf-8?B?eDZ1Y1NpamtHTmdsdFZJWUhzbGxUTFQ2Vm1BeWlqYnMrZUdYYnZjMjBsWG5S?=
 =?utf-8?B?NzZ4NlpDbmlLRTc4RlB6ZWZ6aEtaVVd4TkxVM2h3ZFp1N1Q4OVQ5VUpwZi9m?=
 =?utf-8?B?K0xsVDlNbkpMUVdsQ016OW1IOTFQZFgyU2pIS2w3VlhqbTdnTDlZcjFnenpp?=
 =?utf-8?B?V01nZFFJT1MrbmFmbWx2b2FGaHRJdmk2dVh0SU5IYlduV05yenFHMDVCOFJV?=
 =?utf-8?B?Skd5cmtJamRKb21zWXFLaFJtRGpDWkFJdWVucFJmbnQxaWhTb3hVS2xWcms2?=
 =?utf-8?B?cWhtdE1seVNBPT0=?=
X-Forefront-Antispam-Report: CIP:18.7.68.33; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:outgoing-alum.mit.edu; PTR:outgoing-alum.mit.edu;
 CAT:NONE;
 SFS:(13230040)(376014)(43022699015)(41320700013)(1800799024)(82310400026)(36860700013)(13003099007)(8096899003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: alum.mit.edu
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2025 19:19:30.3827 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80cf7fbf-db6b-4934-4479-08dda1413bfe
X-MS-Exchange-CrossTenant-Id: 3326b102-c043-408b-a990-b89e477d582f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3326b102-c043-408b-a990-b89e477d582f; Ip=[18.7.68.33];
 Helo=[outgoing-alum.mit.edu]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5708
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

--000000000000a5aa920636878697
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The msvld error implies that you don't have video decoding firmware
installed. This is fine if you don't want it, but if you want h264/vc1
decoding accel, have a look at
https://nouveau.freedesktop.org/VideoAcceleration.html . Basically you need
to extract the firmware from the official driver.

I think that the ce channel error might be fine? Does the rest of the
driver load OK? I have a vague recollection that GF114 has 2 types of CE
channels, but one of them is the "gzip acceleration" one which isn't used
in practice, and that's what this error is about. Could have been GF104
though ... does 3d acceleration work OK with the hardware driver? If it
does, you don't need to worry about it.

Cheers,

  -ilia

On Sat, May 31, 2025 at 1:02=E2=80=AFAM G2 <g2subspstlc@gmail.com> wrote:

> hey,
>
> on an older asus gv75w running parrotOS with kernel Linux 6.12.12-amd64, =
a
> few errors, see below, regarding nouveau driver shows up in dmesg output.
> this is a fresh new OS install.
>
> are the errors the result of the nvida license issue or is it something
> else warranting more investigation to fix?
>
>
> #---[ sudo lshw -C display, (shortened output) ]--------------------
>   *-display
>        description: VGA compatible controller
>        product: GF114M [GeForce GTX 670M]
>        vendor: NVIDIA Corporation
>        capabilities: pm msi pciexpress vga_controller bus_master cap_list
> rom fb
>        configuration: depth=3D32 driver=3Dnouveau latency=3D0
> resolution=3D1920,1080
>
> #------------------------------------------------------------------------=
-------
>
> #---[ dmesg errors ]-----------------------------------------------------=
--
>
> May 25 08:51:40 parrot-33 kernel: nouveau 0000:01:00.0: msvld: init
> failed, -19
> May 25 08:51:40 parrot-33 kernel: nouveau 0000:01:00.0: msvld: unable to
> load firmware data
> May 25 08:51:40 parrot-33 kernel: nouveau 0000:01:00.0: Direct firmware
> load for nouveau/nvce_fuc084d failed with error -2
> May 25 08:51:40 parrot-33 kernel: nouveau 0000:01:00.0: firmware: failed
> to load nouveau/nvce_fuc084d (-2)
> May 25 08:51:40 parrot-33 kernel: nouveau 0000:01:00.0: firmware: failed
> to load nouveau/nvce_fuc084d (-2)
>
> May 25 08:51:34 parrot-33 kernel: nouveau 0000:01:00.0: drm: failed to
> create ce channel, -22
>
>
> #------------------------------------------------------------------------=
-------
>
> regards,
> wb
>
>

--000000000000a5aa920636878697
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The msvld error implies that you don&#39;t have video deco=
ding firmware installed. This is fine if you don&#39;t want it, but if you =
want h264/vc1 decoding accel, have a look at=C2=A0<a href=3D"https://nouvea=
u.freedesktop.org/VideoAcceleration.html">https://nouveau.freedesktop.org/V=
ideoAcceleration.html</a> . Basically you need to extract the firmware from=
 the official driver.<div><br></div><div>I think that the ce channel error =
might be fine? Does the rest of the driver load OK? I have a vague recollec=
tion that GF114 has 2 types of CE channels, but one of them is the &quot;gz=
ip acceleration&quot; one which isn&#39;t used in practice, and that&#39;s =
what this error is about. Could have been GF104 though ... does 3d accelera=
tion work OK with the hardware driver? If it does, you don&#39;t need to wo=
rry about it.</div><div><br></div><div>Cheers,</div><div><br></div><div>=C2=
=A0 -ilia</div></div><br><div class=3D"gmail_quote gmail_quote_container"><=
div dir=3D"ltr" class=3D"gmail_attr">On Sat, May 31, 2025 at 1:02=E2=80=AFA=
M G2 &lt;<a href=3D"mailto:g2subspstlc@gmail.com">g2subspstlc@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">hey,=
<br>
<br>
on an older asus gv75w running parrotOS with kernel Linux 6.12.12-amd64, a =
few errors, see below, regarding nouveau driver shows up in dmesg output. t=
his is a fresh new OS install.<br>
<br>
are the errors the result of the nvida license issue or is it something els=
e warranting more investigation to fix?<br>
<br>
<br>
#---[ sudo lshw -C display, (shortened output) ]--------------------<br>
=C2=A0 *-display=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0description: VGA compatible controller<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0product: GF114M [GeForce GTX 670M]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0vendor: NVIDIA Corporation<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0capabilities: pm msi pciexpress vga_controller b=
us_master cap_list rom fb<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0configuration: depth=3D32 driver=3Dnouveau laten=
cy=3D0 resolution=3D1920,1080<br>
#--------------------------------------------------------------------------=
-----<br>
<br>
#---[ dmesg errors ]-------------------------------------------------------=
<br>
<br>
May 25 08:51:40 parrot-33 kernel: nouveau 0000:01:00.0: msvld: init failed,=
 -19<br>
May 25 08:51:40 parrot-33 kernel: nouveau 0000:01:00.0: msvld: unable to lo=
ad firmware data<br>
May 25 08:51:40 parrot-33 kernel: nouveau 0000:01:00.0: Direct firmware loa=
d for nouveau/nvce_fuc084d failed with error -2<br>
May 25 08:51:40 parrot-33 kernel: nouveau 0000:01:00.0: firmware: failed to=
 load nouveau/nvce_fuc084d (-2)<br>
May 25 08:51:40 parrot-33 kernel: nouveau 0000:01:00.0: firmware: failed to=
 load nouveau/nvce_fuc084d (-2)<br>
<br>
May 25 08:51:34 parrot-33 kernel: nouveau 0000:01:00.0: drm: failed to crea=
te ce channel, -22<br>
<br>
#--------------------------------------------------------------------------=
-----<br>
<br>
regards,<br>
wb<br>
<br>
</blockquote></div>

--000000000000a5aa920636878697--
