Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8DA456F33
	for <lists+nouveau@lfdr.de>; Fri, 19 Nov 2021 14:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C45CF89BD5;
	Fri, 19 Nov 2021 13:00:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2066.outbound.protection.outlook.com [40.107.20.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757FF89BD5
 for <nouveau@lists.freedesktop.org>; Fri, 19 Nov 2021 13:00:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iqU+7IKlsnoNL79hPy7iFF7PvUc+1dNvl0QsMuIQMAnD/cDygA/svS61U7OYgGg3AXoz6KJ9/BjmCQziEcQDN71vAls40bt0qZ2M1u8wXNXC96+EKo8+AQPAVviOPj0CyI7R7HhxsVIug2ftGM4gaKqJksUjteKJH4cqnY7/5+9mrejpY+N6PWEFjuZ4NhTH27bkDhHjJjq/MgKlJfDni65yN9JiC4PqtRzhYHQ20GaxvAyCZBircDZNqCgYGln2XiDtMimmgaDpOS0dXTksb9XgKvwRNvMI0509jG9PUBfxsx3CEfbjoNJm4fmBk0gh95hOw3HCACdxlMlOLbQntA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFb6dZ6q7CF1Y5bIzq1rkfm29htZyD2RwspZ2i6SeWY=;
 b=hPU1t+K7/d/OEBX6hyPW9HnpxAg913s3ELgdbD4u1Z4G9V8Q3axnvDQwedbbzUkrV+1kI95XOrt+5GEE7Fr1LT4kZjpEBUp8HAWkgYQREVg6w7X/sK8CkQmKH4GTxhnRMRkR8d+AdUdGix6586xoteXOY2EzDoO+VPTPZ42StE9z51z0Ds4dxlJ/Ln30Fxe18DWF2u2FNGnxqxgpIU1MLj5smqklGHbkQL3dQXDn0/bQK93zXa1WJrWNyOPodlJFIygeom2T9R49XjtPpqndOi2G5ntPjm1BXmlA/qcFtw0BEiZ/PiHMtrPjhzT4aKmpSLj9cycfq425iPBLT8wGlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=urv.cat; dmarc=pass action=none header.from=urv.cat; dkim=pass
 header.d=urv.cat; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rovira.onmicrosoft.com; s=selector2-rovira-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFb6dZ6q7CF1Y5bIzq1rkfm29htZyD2RwspZ2i6SeWY=;
 b=J+ps7mYb2m05xvN5iFMYwYyZgzyb/GX1qPYb50Xf7uKntUuh++R8PUuitCcfEyVJ173RXsJGkM1eArmj8hEClA6YxwU42oNoaGFjj07ujEDlqIaHZDAEtOc8vd3Hb0pMzlW7rJUZ17ZCmyZDHH236h+Zw+KFXaJK76Jed2RhdoQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=urv.cat;
Received: from VI1PR01MB4335.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:65::11) by VI1PR0102MB3486.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:17::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 13:00:04 +0000
Received: from VI1PR01MB4335.eurprd01.prod.exchangelabs.com
 ([fe80::ac20:c842:53ae:2039]) by VI1PR01MB4335.eurprd01.prod.exchangelabs.com
 ([fe80::ac20:c842:53ae:2039%3]) with mapi id 15.20.4690.027; Fri, 19 Nov 2021
 13:00:02 +0000
To: nouveau <nouveau@lists.freedesktop.org>
References: <19065a66-ce89-b9b9-d534-eb2cabff7825@urv.cat>
 <CACO55tuWxXJoWJk-V11f-bb+6akfjBYiG8L0RoCZfRiceo9N5Q@mail.gmail.com>
 <3f418b50-e731-ff71-dc93-b065f9be8389@urv.cat>
 <CACO55tsqBSSzyeyJbS-81rO4=JXtdJxz_vOHoc-f7rvVwZdLog@mail.gmail.com>
From: dmanye <dmanye@urv.cat>
Message-ID: <f7a8c82c-2fa3-60ed-40e4-ccde4a96b8c6@urv.cat>
Date: Fri, 19 Nov 2021 13:59:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
In-Reply-To: <CACO55tsqBSSzyeyJbS-81rO4=JXtdJxz_vOHoc-f7rvVwZdLog@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: es_CU
X-ClientProxiedBy: HE1P192CA0010.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::20)
 To VI1PR01MB4335.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:65::11)
MIME-Version: 1.0
Received: from [10.21.102.202] (193.147.222.245) by
 HE1P192CA0010.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.20 via Frontend Transport; Fri, 19 Nov 2021 12:59:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2194ce7e-ebba-4a49-cb71-08d9ab5c7f7f
X-MS-TrafficTypeDiagnostic: VI1PR0102MB3486:
X-Microsoft-Antispam-PRVS: <VI1PR0102MB34865DCF08733C3CFA006A6BFD9C9@VI1PR0102MB3486.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Okwqn0SulPuZs4LvvomwZn9FnEUgHXDYK80ncWUBBnez5fMav76YPkOFC1TQ1Tf/h8vUHCQNMJ90hMaODlaMj1PrEERvwUE2Yqm1suxK2yxWENoVBPuvXPUDSK+tWFGY41U5qgvXcodga9ojvo0fRT0tJXfl6h4kdQUKMysfpn3ZfB//LXQwldNqpvXe0fG/2CyHFIT2pL2jE77dAZRjntMoQf9rCTx54f+U2c9mckT2DMSnDjtsjLOpljrz98YAKzwi6VeT9tb1p0EFyofmvc2gJEefn+96e9NU83eqM7GaZLEL0Tr9cYeE+Cry+SLuyypIV2+2P3Nhgpr0rvHc2f8ZpaPoexI8LBVmi9/KFs/EBJspXsMZmprcYQP5DPiB0ugz3TkUfCwGz5vn/Lnm9dQcsWpixUiDCNYCM3wd3FYhDLch7zM/DsX/TYOMUebbhfGuLEcJsJ8hG/oI0XYQOKgWPE0WJW0Gjmp/oup0UAw5Td9ui/T773f7yLp+6xmVim1VjWHcGlm2gK6rv5T0G0NrSAAga0arckM1hhbv3SrATUJrU8gs1Reobqla0jeDFeDNorjcXeHOdr+W1gSIZrsughYzOYhmBhL4r4tMb6aRzGOafFgpOkkkl0Rx5NbUYKhT7vAeCwCf/PPWvt0GwXsQ9G7mAF+1ZgTV2wwcLZur8/Uwd5Z3LnMDHhOH/Zsb20FyQcGrLJRklDNmD+22wKUgVxOWc0GJDJqO1vcpE2Y5hO5QgPm8/EGzpSjuHFkZYwYdSy/WLRr4f5cxEEqQNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR01MB4335.eurprd01.prod.exchangelabs.com; PTR:;
 CAT:NONE;
 SFS:(366004)(66946007)(66476007)(66556008)(38350700002)(31696002)(6486002)(186003)(26005)(38100700002)(786003)(8676002)(2906002)(956004)(2616005)(53546011)(4744005)(52116002)(6916009)(8936002)(31686004)(316002)(508600001)(36756003)(6666004)(16576012)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzdQaDQ1RDF6ZmZMWk4wcklaWnVoaVhxV0JnSE5lOUMwUzV4QmZtQkdJMzdh?=
 =?utf-8?B?SEJ0Y1hFOVNsM3U5U3Y2bmJYbUNULyt0NDBUY3oxVmlobHRTMmhPa3NWdlRk?=
 =?utf-8?B?ZzAvL3BYcS9KM3UxNitnc1g5S2FzRFAxc3grQjRMN1VPdXVTU1pLZE9mT0Mr?=
 =?utf-8?B?Sk9HWktRTnFMVlhqdS9pOCtwTkdrdUo3Y3lrNW00Ulo2OVYyMnIrWnBZeXBs?=
 =?utf-8?B?YTlQazV3SHJZZGduMFJ5YXBtUG5hZkJIZEpFK083UUNVbFltUHF0cmxEOTZU?=
 =?utf-8?B?cmV4UjRQR25PRlovVHhnVmt0TXZrSWJLTmIraWhwYWdpU2dMUmF2bVJQUDVx?=
 =?utf-8?B?K3FEcE9mcVVES24vRHhhT0VqTWFUR3pYYTg4NzVqZWZEMTFjcWZTd1ZSc2xF?=
 =?utf-8?B?dTY1bVRLUVJrOWd3R01MK043NzE3dEI0ZkdxdUdZSGpXazRTSjZ3Z2xqNkRD?=
 =?utf-8?B?OUF6TEU3dXRMVVlGRzBqdFlvaVE5QnlBbXNPb2loVEtaVXBOWDN2MG5MbVhS?=
 =?utf-8?B?VDFCVEhsL0o2TmlTZm1ReVBGdjFvOCtuWUFaV3lEdWpDK3E3dkVrQWNZSk44?=
 =?utf-8?B?UEJhZ1RPVEs5R0gvRk9udGFXbmJvdVorMDRGa3NPUy9YaDg2RFJXZ2JvRG1M?=
 =?utf-8?B?cHVoYWdZWFp2Zi9abnEyQTRSdit1eG1YMkJiSnJZU1RtaVRodDdlUmE4Zkox?=
 =?utf-8?B?eGNrODJDaVBSL0hDRlZaUk9SVTJTNmY3OGtsMnNxZDFoUWtnaWUySzU2dVJn?=
 =?utf-8?B?VmFwSVFHVXg4Mk5WM21jVC9xSU55TjdlajVuSkFJOEc4bkRLYzJpek91cTV2?=
 =?utf-8?B?SFZSN3B3bWVFK3YxdWM5VXRtV2NrZXh2cCt2MEN3QzFwQW1qbTF1dzJzak9o?=
 =?utf-8?B?blhsb0h0cXJta0tUV3F5aEZjQkV6Z2N1bGJmT2YwODc4WVJFbnpPck5TeXZ6?=
 =?utf-8?B?TDBSVExmWFlPL1pTWXN0NDcrd3kzVEFEOUd5U3o3OWN6TENOOVFKWVF4ZHI0?=
 =?utf-8?B?b1EwTWVxdXBKYTJJcjJBSGZYSTlicEZwWFRFeUp4MEh6QmFUWmVrK043b0JD?=
 =?utf-8?B?MWdDd3NQRGpBRU1oWGdXTVYxdTFOeFBOM1hscVdQS2tTUlYyMVJJbkd0dmNE?=
 =?utf-8?B?Zm02NlZUZGZBRlN1V2JVR2lFb1g4bHVRcFQ4T3FtUHBzckN0VHYxbHpaUFha?=
 =?utf-8?B?NWc0QmYzQ09pN09VWFRBU2w2Z1N6VUg3YnQ0ZmpEd0VSUmxVeC9OUWEyNlcv?=
 =?utf-8?B?TDhvaXI3R2ZDajhWcEFmckxCN0FGSVpkc1ZxVFJncnQ2TThheHZkQXJGZ3Yw?=
 =?utf-8?B?S2JEVjhTU1RwSCtnNDU0VTR6dmtiRUZzV2UxTW9kYXhMajVKMm1DM3JIY1ZI?=
 =?utf-8?B?aEVRTnNueHE3czFPZ0pxL0o4SVdiMWFHQmJaQzhlYjhRN1FtQzhzMXNrcytn?=
 =?utf-8?B?STFRRTUvK2FreGF1WEZSckhhL3N5NWdoTDhsaVM2OHR5cVFJTWNsY2c2QU5O?=
 =?utf-8?B?TVVjelFTd0dSSEhMZFZ5bjBnbW5Gd2lKdXAzbjFnS0g5azBSZ1M4eXZRM1NQ?=
 =?utf-8?B?WEdFQ2Yyd3hCcTJHM2pKS2ZWS2lhelhVYUZHb3lQV0Q5SWdUeDVZakxmaXY3?=
 =?utf-8?B?Y0twMlV3TnNxNnpHM3l6UEx0alRUTnB4OFRROFZKdjFEUmJGbDNidjJTeVRh?=
 =?utf-8?B?OGR0ZU95bkZWallid1NaOGRzN0k4RDFhcTR0bER0QkFjOXFpaWl3TmZ6bHkw?=
 =?utf-8?B?RC9MMTNDVjM1ZnRBcFhoNTl5bDdzb2cxYUlQbm9OZjVMa290ZzlSWUhXb2pX?=
 =?utf-8?B?TjVBTkVZQXJuc2ZnS0k2Z3pZZlNWaTJIVWk2RUVlSFJESFBpMEN2YVBhSkQx?=
 =?utf-8?B?azFSQ3lxNUdVcExkeEhYQW1oOG5DeTRtZTRJbTQyZVpXeExpMkIwZFB0UEpQ?=
 =?utf-8?B?eDVwVVVVOWtSQXFHZVQ1NUw1SlFDOEZZb1J5VG42WGVzclNXdWJVcXFpNGEy?=
 =?utf-8?B?QjlzZWVKTmN4cms1SStEc2daZDJCTDhOYlR1ZnpWM3dNQ3FTQkZzWVRVOC9v?=
 =?utf-8?B?a1BaZ0t2SWEvcmFnZkJCR050SkZMMWYyazNaeVNVTE90bGFtSTJiY1NFWWpo?=
 =?utf-8?B?Sk44U1RZdVBMVjdzZjh1RENhUUkxbFJpaFcveWlId3Q0UjNOamJIS0wyQWJL?=
 =?utf-8?Q?tKVK8kOhNunPqGqQaWfHucQ=3D?=
X-OriginatorOrg: urv.cat
X-MS-Exchange-CrossTenant-Network-Message-Id: 2194ce7e-ebba-4a49-cb71-08d9ab5c7f7f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR01MB4335.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 13:00:01.6137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f311296b-3e82-4c4e-82a9-a8e403a42b11
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N18J3mXJbYPnwCBMSxrpgG0R32YfRezzkx09ouw1F6pU857CUAnF88SNNAp+WMUNc2ntEcV/vXsyygatxaGiTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0102MB3486
Subject: Re: [Nouveau] [INVALID_ARG] mthd 0414
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

On 19/11/21 13:31, Karol Herbst wrote:
> yeah.. not quite sure yet. I tried it out with my gk208b gpus, but
> couldn't hit anything. Maybe using VGA makes the difference here. Or
> something else is different. Might also already be fixed in 5.16...
> too many unknowns still. I will do another round of testing with VGA
> and see how that ends.

hello again,

thanks for your effort Karol. i've just found another time the bug and:

1) kept the vga cable in the same place.

2) connected a dvi cable between the same computer and the same monitor.

3) told xrandr to dup the signal through the dvi cable:

DISPLAY=3D:0.0 xrandr --output DVI-D-1 --mode "1920x1080" --same-as VGA-1

4) voil=C3=A0! the monitor, all alone, switched to dvi input and there is m=
y=20
x session up and running.

5) if i force the monitor to change to vga input it refuses it and=20
returns to dvi

so i think the driver does its job but without actually sending anything=20
through the vga cable.


thanks.


